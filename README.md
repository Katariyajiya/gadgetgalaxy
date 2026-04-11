Lotus Electronics readme

      /*🔹 What setOrder(-1) means

                    👉 It sets the priority/order of the filter in the filter chain.

                    Lower number = higher priority (runs earlier)
                    Higher number = runs later

                    So:

                    -1 → runs before most other filters
                    🔹 Why this is important

                    CORS must be handled before security filters (like Spring Security), otherwise:

                    Preflight (OPTIONS) requests might get blocked
                    You’ll see CORS errors even if config is correct
                    🔹 In short

                    👉 setOrder(-1) = run CORS filter very early in the request lifecycle
                    👉 Ensures preflight requests are processed before authentication/security*/
