#!/bin/bash

# clone Git repository
git clone "https://github.com/$GITHUB_ACCOUNT/$GITHUB_REPOSITORY.git";
cd "$GITHUB_REPOSITORY";

# set the Git user
git config --global user.name "$GIT_USER_NAME";
git config --global user.email "$GIT_USER_MAIL";

# remove all the files
rm -rf .;

# fetch files from Salesforce
force login -i=login -u "$SF_USER_ACCOUNT" -p "$SF_USER_PASSWORD";
force fetch -t ApexClass;
force fetch -t ApexPage;
force fetch -t ApexTrigger;

# commit changes
today=`date "+%Y%m%d"`;
branch_name=`echo "$BRANCH_NAME_FORMAT" | sed "s/{DATE}/$today/g"`;

git add *
git commit -m "diff commit created by sfci"
git push origin $branch_name

# Create a pull request
curl -H "Authorization: bearer $GITHUB_API_TOKEN" -X POST --data " \
{ \
  \"title\": \"updates detected\", \
  \"body\": \"You can merge this pull request.\", \
  \"head\": \"$branch_name\",  \
  \"base\": \"$BASE_BRANCH\" \
} \
" https://api.github.com/repos/$GITHUB_ACCOUNT/$GITHUB_REPOSITORY/pulls
