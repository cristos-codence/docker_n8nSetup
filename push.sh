git checkout aider-cristos
git add .
aider --commit --no-restore-chat-history
git checkout development
git merge aider-cristos
git push
git checkout aider-cristos