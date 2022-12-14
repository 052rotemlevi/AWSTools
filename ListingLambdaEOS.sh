runtimes=("dotnetcore3.1" "nodejs12.x" "dotnetcore2.1" "python3.6" "python2.7" "ruby2.5" "nodejs10.x" "nodejs8.10" "nodejs6.10" "nodejs4.3-edge" "nodejs4.3" "nodejs")
for region in `aws ec2 describe-regions --query "Regions[].RegionName" --region us-west-1 --output text`
do
    echo "[${region}]"
    for runtime in ${runtimes[@]}
    do
        aws lambda list-functions --region ${region} --output text --query "Functions[?Runtime=='${runtime}'].{ARN:FunctionArn, Runtime:Runtime}"
    done
done

