if [ -z "$DOCKER_REPOSITORY" ]; then
	DOCKER_REPOSITORY=`basename "$PWD"`;
	echo -e "\x1B[33m'DOCKER_REPOSITORY' will be set '$DOCKER_REPOSITORY'.\x1B[0m";
fi

indent() { sed 's/^/    /'; }

targets=`find . -type f -name Dockerfile`

echo "-- Targets:"
echo "${targets[*]}"

for target in ${targets[*]}; do
	directory=`dirname $target`;
	version=`basename $directory`;
	compiler=`basename $(dirname $directory)`;

	echo; echo;
	echo -e "\x1B[34m-- Building: $compiler-$version\x1B[0m";

	docker build -t "$DOCKER_REPOSITORY:$compiler-$version" "$directory" | indent;
	if [ ${PIPESTATUS[0]} -ne 0 ]; then
		echo -e "\x1B[31m-- Build failed: $compiler-$version\x1B[0m"
	fi
done

echo; echo;
docker images $DOCKER_REPOSITORY

if [ "$TRAVIS_BRANCH" == "master" ]; then
	echo; echo;
	echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin;
	docker push $DOCKER_REPOSITORY || exit 1;
fi
