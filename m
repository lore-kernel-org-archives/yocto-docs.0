Received: from bsmtp1.bon.at (bsmtp1.bon.at [213.33.87.15])
 by mx.groups.io with SMTP id smtpd.web09.10316.1616753321020795380
 for <docs@lists.yoctoproject.org>;
 Fri, 26 Mar 2021 03:08:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.15, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp1.bon.at (Postfix) with ESMTPSA id 4F6Hjw5FP7z5tl9;
	Fri, 26 Mar 2021 11:08:36 +0100 (CET)
Date: Fri, 26 Mar 2021 11:08:35 +0100
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: yocto@lists.yoctoproject.org, richard.purdie@linuxfoundation.org,
	docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 1/2] scripts/run-docs-build: add for loop when publishing tags/branches
Message-ID: <20210326100835.yqjsor3qrgfagdvg@qschulz>
References: <20210325181211.59332-1-nicolas.dechesne@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20210325181211.59332-1-nicolas.dechesne@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Nicolas,

On Thu, Mar 25, 2021 at 07:12:10PM +0100, Nicolas Dechesne wrote:
> Use for loop to avoid repeating the same pattern over and over.
> 
> Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
> ---
>  scripts/run-docs-build | 72 ++++++++++++++++--------------------------
>  1 file changed, 27 insertions(+), 45 deletions(-)
> 
> diff --git a/scripts/run-docs-build b/scripts/run-docs-build
> index 79b1edc..e8e081c 100755
> --- a/scripts/run-docs-build
> +++ b/scripts/run-docs-build
> @@ -33,17 +33,14 @@ make publish
>  mkdir $outputdir/bitbake/next
>  cp -r ./_build/final/* $outputdir/bitbake/next
>  
> -git checkout 1.48
> -make clean
> -make publish
> -mkdir $outputdir/bitbake/1.48
> -cp -r ./_build/final/* $outputdir/bitbake/1.48
> -
> -git checkout 1.46
> -make clean
> -make publish
> -mkdir $outputdir/bitbake/1.46
> -cp -r ./_build/final/* $outputdir/bitbake/1.46
> +# stable branches
> +for branch in 1.46 1.48; do
> +    git checkout $branch
> +    make clean
> +    make publish
> +    mkdir $outputdir/bitbake/$branch
> +    cp -r ./_build/final/* $outputdir/bitbake/$branch
> +done
>  
>  # only sync bitbake folder for now. We need bitbake to be published first
>  # since the bitbake intersphinx index will be downloaded to build yocto-docs
> @@ -69,40 +66,25 @@ make publish
>  mkdir $outputdir/next
>  cp -r ./_build/final/* $outputdir/next
>  
> -cd $ypdocs
> -git checkout gatesgarth
> -make clean
> -make publish
> -mkdir $outputdir/gatesgarth
> -cp -r ./_build/final/* $outputdir/gatesgarth
> -
> -cd $ypdocs
> -git checkout dunfell
> -make clean
> -make publish
> -mkdir $outputdir/dunfell
> -cp -r ./_build/final/* $outputdir/dunfell
> -
> -cd $ypdocs
> -git checkout yocto-3.2.1
> -make clean
> -make publish
> -mkdir $outputdir/3.2.1
> -cp -r ./_build/final/* $outputdir/3.2.1
> -
> -cd $ypdocs
> -git checkout yocto-3.2
> -make clean
> -make publish
> -mkdir $outputdir/3.2
> -cp -r ./_build/final/* $outputdir/3.2
> -
> -cd $ypdocs
> -git checkout yocto-3.1.5
> -make clean
> -make publish
> -mkdir $outputdir/3.1.5
> -cp -r ./_build/final/* $outputdir/3.1.5
> +# stable branches
> +for branch in dunfell gatesgarth; do
> +    cd $ypdocs
> +    git checkout $branch
> +    make clean
> +    make publish
> +    mkdir $outputdir/$branch
> +    cp -r ./_build/final/* $outputdir/$branch
> +done
> +
> +# Yocto Project releases/tags
> +for tag in 3.1.5 3.2 3.2.1; do

What about using `git tag -l 3.2*` so that we don't need to maintain the
list of tags?

Or, maybe `git tag --contains <3.1.5 commit hash introducing sphinx doc>
--contains <3.2 commit hash introducing sphinx doc>` so that the
3.1.[56789] tags don't need to be added either?

Same mechanism can be used for bitbake git repo I guess.

Cheers,
Quentin
