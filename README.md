breee finder
============

As Ruby 2.5 supports rescue/else/ensure in do/end blocks, you no longer need to wrap them in begin/end.

This script finds occurences of such BREEE (begin-rescue-else-ensure-end) in do/end blocks.

## Example

```
$ ruby -v
ruby 2.5.0rc1 (2017-12-14 trunk 61243) [x86_64-darwin16]

$ ruby breee.rb
https://github.com/wantedly/wantedly/blob/master/app/concerns/project_elasticsearch_concern.rb#L144
https://github.com/wantedly/wantedly/blob/master/app/concerns/social_profile_github_concern.rb#L31
https://github.com/wantedly/wantedly/blob/master/app/concerns/user_elasticsearch_concern.rb#L593
https://github.com/wantedly/wantedly/blob/master/app/concerns/user_elasticsearch_concern.rb#L713
https://github.com/wantedly/wantedly/blob/master/app/controllers/application_controller.rb#L296
https://github.com/wantedly/wantedly/blob/master/app/controllers/concerns/notifications_controller_concern.rb#L9
https://github.com/wantedly/wantedly/blob/master/app/controllers/enterprise/scouts_controller.rb#L68
https://github.com/wantedly/wantedly/blob/master/app/models/company.rb#L734
https://github.com/wantedly/wantedly/blob/master/app/models/journal.rb#L212
https://github.com/wantedly/wantedly/blob/master/app/models/project.rb#L1065
https://github.com/wantedly/wantedly/blob/master/app/models/user.rb#L296
https://github.com/wantedly/wantedly/blob/master/lib/huntr/apply_standard_plan_options.rb#L13
https://github.com/wantedly/wantedly/blob/master/lib/huntr/date_and_time.rb#L64
https://github.com/wantedly/wantedly/blob/master/lib/huntr/db_circuit_breaker/circuit/base.rb#L114
https://github.com/wantedly/wantedly/blob/master/lib/huntr/treasure_data_to_big_query.rb#L6
https://github.com/wantedly/wantedly/blob/master/spec/models/project_tweet_spec.rb#L266
https://github.com/wantedly/wantedly/blob/master/spec/rails_helper.rb#L216
```


## References

- https://bugs.ruby-lang.org/issues/12906
