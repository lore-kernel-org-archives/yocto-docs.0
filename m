Received: from bsmtp3.bon.at (bsmtp3.bon.at [213.33.87.17])
 by mx.groups.io with SMTP id smtpd.web12.1990.1605173675216366972
 for <docs@lists.yoctoproject.org>;
 Thu, 12 Nov 2020 01:34:36 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.17, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp3.bon.at (Postfix) with ESMTPSA id 4CWxJT0Vj9z5tlN;
	Thu, 12 Nov 2020 10:34:32 +0100 (CET)
Date: Thu, 12 Nov 2020 10:34:31 +0100
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH v2 1/2] poky.yaml: remove unused variables
Message-ID: <20201112093431.zjubhoxishftddsd@qschulz>
References: <20201112075206.113124-1-nicolas.dechesne@linaro.org>
 <20201112075206.113124-2-nicolas.dechesne@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20201112075206.113124-2-nicolas.dechesne@linaro.org>
User-Agent: NeoMutt/20180716
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Nicolas,

On Thu, Nov 12, 2020 at 08:52:05AM +0100, Nicolas Dechesne wrote:
> There are plenty of variables in poky.yaml which are not used anywhere
> in the docs. So let's remove them. We can always add the one we need
> later.
> 
> Note ORGEMAIL could be used in boilerplate.rst, however this file is
> not parsed but included, and somehow the yocto-vars.py exenstion does
> not process this file, so we cannot use a variable there.
> 
> Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
> ---
>  documentation/poky.yaml | 47 -----------------------------------------
>  1 file changed, 47 deletions(-)
> 
> diff --git a/documentation/poky.yaml b/documentation/poky.yaml
> index e39c403fe..85f42cf07 100644
> --- a/documentation/poky.yaml
> +++ b/documentation/poky.yaml
> @@ -1,62 +1,15 @@
>  DISTRO : "3.1"
> -DISTRO_COMPRESSED : "31"
>  DISTRO_NAME_NO_CAP : "dunfell"
>  DISTRO_NAME : "Dunfell"
>  DISTRO_NAME_NO_CAP_MINUS_ONE : "zeus"
> -DISTRO_NAME_MINUS_ONE : "Zeus"
>  YOCTO_DOC_VERSION : "3.1"
>  YOCTO_DOC_VERSION_MINUS_ONE : "3.0.2"
>  DISTRO_REL_TAG : "yocto-3.1"
> -METAINTELVERSION : "12.0"
> -REL_MONTH_YEAR : "April 2020"
> -META_INTEL_REL_TAG : "&METAINTELVERSION;-&DISTRO_NAME_NO_CAP;-&YOCTO_DOC_VERSION;"
>  POKYVERSION : "23.0.0"
> -POKYVERSION_COMPRESSED : "2300"
>  YOCTO_POKY : "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;"
> -COPYRIGHT_YEAR : "2010-2020"
> -ORGNAME : "The Yocto Project"
> -ORGEMAIL : "docs@lists.yoctoproject.org"
>  YOCTO_DL_URL : "https://downloads.yoctoproject.org"
> -YOCTO_HOME_URL : "https://www.yoctoproject.org"
> -YOCTO_LISTS_URL : "https://lists.yoctoproject.org"
> -YOCTO_BUGZILLA_URL : "https://bugzilla.yoctoproject.org"
> -YOCTO_WIKI_URL : "https://wiki.yoctoproject.org"
>  YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"
> -YOCTO_GIT_URL : "https://git.yoctoproject.org"
> -YOCTO_ADTREPO_URL : "http://adtrepo.yoctoproject.org"
> -OE_HOME_URL : "https://www.openembedded.org"
> -OE_LISTS_URL : "https://lists.openembedded.org"
> -OE_DOCS_URL : "https://docs.openembedded.org"
> -OH_HOME_URL : "http://o-hand.com"
> -BITBAKE_HOME_URL : "http://developer.berlios.de/projects/bitbake/"
> -YOCTO_DOCS_URL : "&YOCTO_HOME_URL;/docs"
> -YOCTO_SOURCES_URL : "&YOCTO_HOME_URL;/sources/"
> -YOCTO_AB_PORT_URL : "https://autobuilder.yocto.io/"
> -YOCTO_AB_NIGHTLY_URL : "&YOCTO_AB_PORT_URL;/pub/nightly/"
> -YOCTO_POKY_URL : "&YOCTO_DL_URL;/releases/poky/"
>  YOCTO_RELEASE_DL_URL : "&YOCTO_DL_URL;/releases/yocto/yocto-&DISTRO;"
> -YOCTO_TOOLCHAIN_DL_URL : "&YOCTO_RELEASE_DL_URL;/toolchain/"
> -YOCTO_ADTINSTALLER_DL_URL : "&YOCTO_RELEASE_DL_URL;/adt-installer"
> -YOCTO_POKY_DL_URL : "&YOCTO_RELEASE_DL_URL;/&YOCTO_POKY;.tar.bz2"
> -YOCTO_MACHINES_DL_URL : "&YOCTO_RELEASE_DL_URL;/machines"
> -YOCTO_QEMU_DL_URL : "&YOCTO_MACHINES_DL_URL;/qemu"
> -YOCTO_PYTHON-i686_DL_URL : "&YOCTO_DL_URL;/releases/miscsupport/python-nativesdk-standalone-i686.tar.bz2"
> -YOCTO_PYTHON-x86_64_DL_URL : "&YOCTO_DL_URL;/releases/miscsupport/python-nativesdk-standalone-x86_64.tar.bz2"
> -YOCTO_DOCS_QS_URL : "&YOCTO_DOCS_URL;/&YOCTO_DOC_VERSION;/yocto-project-qs/yocto-project-qs.html"
> -YOCTO_DOCS_REF_URL : "&YOCTO_DOCS_URL;/&YOCTO_DOC_VERSION;/ref-manual/ref-manual.html"
> -YOCTO_DOCS_BSP_URL : "&YOCTO_DOCS_URL;/&YOCTO_DOC_VERSION;/bsp-guide/bsp-guide.html"
> -YOCTO_DOCS_DEV_URL : "&YOCTO_DOCS_URL;/&YOCTO_DOC_VERSION;/dev-manual/dev-manual.html"
> -YOCTO_DOCS_KERNEL_DEV_URL : "&YOCTO_DOCS_URL;/&YOCTO_DOC_VERSION;/kernel-dev/kernel-dev.html"
> -YOCTO_DOCS_PROF_URL : "&YOCTO_DOCS_URL;/&YOCTO_DOC_VERSION;/profile-manual/profile-manual.html"
> -YOCTO_DOCS_MM_URL : "&YOCTO_DOCS_URL;/&YOCTO_DOC_VERSION;/mega-manual/mega-manual.html"
> -YOCTO_DOCS_BB_URL : "&YOCTO_DOCS_URL;/&YOCTO_DOC_VERSION;/bitbake-user-manual/bitbake-user-manual.html"
> -YOCTO_DOCS_TOAST_URL : "&YOCTO_DOCS_URL;/&YOCTO_DOC_VERSION;/toaster-manual/toaster-manual.html"
> -YOCTO_DOCS_SDK_URL : "&YOCTO_DOCS_URL;/&YOCTO_DOC_VERSION;/sdk-manual/sdk-manual.html"
> -YOCTO_DOCS_OM_URL : "&YOCTO_DOCS_URL;/&YOCTO_DOC_VERSION;/overview-manual/overview-manual.html"
> -YOCTO_DOCS_BRIEF_URL : "&YOCTO_DOCS_URL;/&YOCTO_DOC_VERSION;/brief-yoctoprojectqs/brief-yoctoprojectqs.html"
> -YOCTO_ADTPATH_DIR : "/opt/poky/&DISTRO;"
> -YOCTO_POKY_TARBALL : "&YOCTO_POKY;.tar.bz2"
> -OE_INIT_PATH : "&YOCTO_POKY;/oe-init-build-env"

That's a lot of variables removed... Are you sure they are never used?
(compile with and without this change, and diff the html).

Just to be sure I didn't misunderstood the usecase for those variables:
it is so we can have "dynamic" values in litteral blocks (:: and maybe
others?), because those in yocto-vars.py don't work IIRC (they are not
"translated", i.e. :yocto_git:`/` will be put as isin the litteral block).

Quentin
