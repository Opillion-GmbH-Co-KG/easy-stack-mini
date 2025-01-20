| Command                                 | Description                                                                 |
|-----------------------------------------|-----------------------------------------------------------------------------|
| mc alias list                           | Lists all configured S3-compatible hosts that `mc` can connect to.          |
| mc alias remove                         | Removes a configured alias.                                                 |
| mc alias set                            | Adds or updates an alias for an S3-compatible host.                         |
| mc alias import                         | Imports aliases from a file.                                                |
| mc alias export                         | Exports aliases to a file.                                                  |
| mc anonymous get                        | Retrieves an anonymous policy for a bucket.                                 |
| mc anonymous get-json                   | Retrieves an anonymous policy for a bucket in JSON format.                  |
| mc anonymous links                      | Lists all public URLs for a bucket.                                         |
| mc anonymous list                       | Lists anonymous policies set on a bucket.                                   |
| mc anonymous set                        | Sets an anonymous policy on a bucket.                                       |
| mc anonymous set-json                   | Sets an anonymous policy on a bucket using JSON input.                      |
| mc batch describe                       | Describes job tasks for a MinIO deployment.                                 |
| mc batch generate                       | Generates a new batch job configuration.                                    |
| mc batch list                           | Lists all defined batch jobs.                                               |
| mc batch start                          | Starts a batch job.                                                         |
| mc batch status                         | Displays the status of a batch job.                                         |
| mc cat                                  | Concatenates or displays the contents of a file or object.                  |
| mc cp                                   | Copies objects to/from a MinIO deployment.                                  |
| mc diff                                 | Computes differences between directories or MinIO buckets.                  |
| mc du                                   | Summarizes disk usage for buckets, folders, or local filesystems.           |
| mc encrypt clear                        | Clears encryption settings on a bucket.                                     |
| mc encrypt info                         | Displays encryption settings of a bucket.                                   |
| mc encrypt set                          | Sets encryption settings for a bucket.                                      |
| mc event add                            | Adds a bucket event notification.                                           |
| mc event ls                             | Lists bucket event notifications.                                           |
| mc event rm                             | Removes a bucket event notification.                                        |
| mc find                                 | Searches for objects in a MinIO deployment or files on a local filesystem.  |
| mc get                                  | Downloads an object from an S3 deployment.                                  |
| mc head                                 | Displays the first `n` lines of an object.                                  |
| mc idp ldap accesskey                   | Manages access keys for LDAP users.                                         |
| mc idp ldap accesskey create-with-login | Creates an access key for an LDAP user with login credentials.              |
| mc idp ldap add                         | Adds a new LDAP configuration.                                              |
| mc idp ldap disable                     | Disables an LDAP configuration.                                             |
| mc idp ldap enable                      | Enables an LDAP configuration.                                              |
| mc idp ldap info                        | Displays information about an LDAP configuration.                           |
| mc idp ldap ls                          | Lists LDAP configurations.                                                  |
| mc idp ldap policy                      | Manages policies for LDAP configurations.                                   |
| mc idp ldap rm                          | Removes an LDAP configuration.                                              |
| mc idp ldap update                      | Updates an LDAP configuration.                                              |
| mc idp openid add                       | Adds an OpenID configuration.                                               |
| mc idp openid disable                   | Disables an OpenID configuration.                                           |
| mc idp openid enable                    | Enables an OpenID configuration.                                            |
| mc idp openid info                      | Displays information about an OpenID configuration.                         |
| mc idp openid ls                        | Lists OpenID configurations.                                                |
| mc idp openid rm                        | Removes an OpenID configuration.                                            |
| mc idp openid update                    | Updates an OpenID configuration.                                            |
| mc idp ldap policy attach               | Attaches a policy to an LDAP entity.                                        |
| mc idp ldap policy detach               | Detaches a policy from an LDAP entity.                                      |
| mc idp ldap policy entities             | Lists entities associated with a policy.                                    |
| mc ilm restore                          | Restores object lifecycle policies.                                         |
| mc ilm rule add                         | Adds a new lifecycle rule.                                                  |
| mc ilm rule edit                        | Edits an existing lifecycle rule.                                           |
| mc ilm rule export                      | Exports lifecycle rules.                                                    |
| mc ilm rule import                      | Imports lifecycle rules.                                                    |
| mc ilm rule ls                          | Lists all lifecycle rules.                                                  |
| mc ilm rule rm                          | Removes a lifecycle rule.                                                   |
| mc ilm tier add                         | Adds a new tier for object storage.                                         |
| mc ilm tier check                       | Checks the status of a tier.                                                |
| mc ilm tier info                        | Displays information about a tier.                                          |
| mc ilm tier ls                          | Lists all storage tiers.                                                    |
| mc ilm tier rm                          | Removes a storage tier.                                                     |
| mc ilm tier update                      | Updates a storage tier configuration.                                       |
| mc legalhold clear                      | Removes the legal hold on objects.                                          |
| mc legalhold info                       | Displays information on legal hold settings.                                |
| mc legalhold set                        | Sets a legal hold on objects.                                               |
| mc license info                         | Displays license information for a MinIO cluster.                           |
| mc license register                     | Registers a MinIO cluster license.                                          |
| mc license update                       | Updates a MinIO cluster license.                                            |
| mc ls                                   | Lists buckets and objects in a MinIO deployment.                            |
| mc mb                                   | Creates a new bucket or directory.                                          |
| mc mirror                               | Synchronizes content between sources and targets.                           |
| mc mv                                   | Moves an object from one location to another.                               |
| mc od                                   | Copies a local file to a remote location in parts.                          |
| mc ping                                 | Checks the liveness of a specified target.                                  |
| mc pipe                                 | Streams content from STDIN to a target object.                              |
| mc put                                  | Uploads an object to a bucket.                                              |
| mc rb                                   | Removes one or more buckets.                                                |
| mc ready                                | Checks the status of a MinIO cluster.                                       |
| mc replicate add                        | Adds a replication configuration.                                           |
| mc replicate backlog                    | Displays replication backlog information.                                   |
| mc replicate export                     | Exports replication settings.                                               |
| mc replicate import                     | Imports replication settings.                                               |
| mc replicate ls                         | Lists replication configurations.                                           |
| mc replicate resync                     | Resynchronizes replication settings.                                        |
| mc replicate rm                         | Removes a replication configuration.                                        |
| mc replicate status                     | Displays the status of a replication job.                                   |
| mc replicate update                     | Updates a replication configuration.                                        |
| mc retention clear                      | Clears retention settings on an object.                                     |
| mc retention info                       | Displays retention settings on an object.                                   |
| mc retention set                        | Sets retention settings on an object.                                       |
| mc rm                                   | Removes objects from a bucket.                                              |
| mc share download                       | Creates a presigned URL for downloading an object.                          |
| mc share ls                             | Lists all active presigned URLs.                                            |
| mc share upload                         | Creates a presigned URL for uploading an object.                            |
| mc sql                                  | Performs SQL queries on objects using the S3 Select interface.              |
| mc stat                                 | Displays information about an object or bucket, including metadata.         |
| mc support callhome                     | Initiates a support callhome to MinIO.                                      |
| mc support diag                         | Runs a diagnostic on the MinIO deployment.                                  |
| mc support inspect                      | Inspects deployment health or configuration.                                |
| mc support perf                         | Displays performance metrics for the deployment.                            |
| mc support profile                      | Profiles the deployment for diagnostics.                                    |
| mc support proxy                        | Configures a proxy for the support command.                                 |
| mc support top api                      | Displays top API metrics.                                                   |
| mc support top disk                     | Displays top disk metrics.                                                  |
| mc support top locks                    | Displays top lock metrics.                                                  |
| mc support upload                       | Uploads support diagnostics for further analysis.                           |
| mc tag list                             | Lists tags associated with a bucket or object.                              |
| mc tag remove                           | Removes tags from a bucket or object.                                       |
| mc tag set                              | Sets tags on a bucket or object.                                            |
| mc tree                                 | Displays the contents of a bucket in a tree format.                         |
| mc undo                                 | Reverses changes from a PUT or DELETE operation.                            |
| mc update                               | Updates the `mc` binary to the latest version.                              |
| mc version enable                       | Enables versioning on a bucket.                                             |
| mc version info                         | Displays versioning status of a bucket.                                     |
| mc version suspend                      | Suspends versioning on a bucket.                                            |
| mc watch                                | Watches for events on a bucket or local filesystem.                         |
