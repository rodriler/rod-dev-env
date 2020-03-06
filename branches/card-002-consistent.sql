--
-- SQL scratchpad with version of meetings queries...
--

INSERT INTO card_030_work        
    SELECT f.calendar_event_id,
           'meeting',
           f.user_id,
           f.org_id,           
           'A',
           f.start_at,
           f.opp_id,
           f.snop_id,
           f.domain,
           f.sfdc_account_id
        FROM (
            SELECT
                row_number() OVER (
                    PARTITION BY e.calendar_event_id ORDER BY e.sortkey DESC, s.amount DESC, e.opp_id ASC
                ) AS row_num,
                e.calendar_event_id,
                e.user_id,
                e.org_id,
                e.start_at,
                s.id AS
                snop_id,
                s.opp_id,
                e.domain,
                oforce.sfdc_account_id
            FROM org, users u, calendar_event_attendee_opp e, snop s, force oforce
            WHERE org.status = 'A' AND u.status = 'A' AND e.status = 'A' AND oforce.status = 'A'
              AND u.org_id = org.id
              AND u.id = e.user_id
              AND org.id = e.org_id AND e.org_id = oforce.org_id
              AND org.pod_id = current_pod()
              AND e.start_at >= min_card_date()
              AND e.opp_id = s.opp_id           
              AND e.org_id = s.org_id
              AND s.sfdc_at <= e.start_at
              AND (s.next_at IS NULL OR s.next_at > e.start_at)
              AND s.is_open AND s.status = 'A' AND s.sortkey IS NOT NULL
              AND e.opp_id = oforce.id
            ORDER BY e.calendar_event_id ASC, e.sortkey DESC, s.amount DESC, e.opp_id ASC
        ) f
        WHERE row_num = 1;
