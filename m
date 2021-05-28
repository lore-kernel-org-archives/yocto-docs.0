Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web11.5700.1622190937971546627
 for <docs@lists.yoctoproject.org>;
 Fri, 28 May 2021 01:35:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.232, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay12.mail.gandi.net (Postfix) with ESMTPSA id B8F94200012;
	Fri, 28 May 2021 08:35:35 +0000 (UTC)
Subject: Re: [docs] [PATCH] documentation: Makefile: turn warnings into errors by default
To: Quentin Schulz <foss@0leil.net>, docs@lists.yoctoproject.org
References: <20210527183150.79497-1-foss@0leil.net>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <08b82e87-ec3f-e713-8e0e-cf739b75efdd@bootlin.com>
Date: Fri, 28 May 2021 10:35:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210527183150.79497-1-foss@0leil.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Quentin,

On 5/27/21 8:31 PM, Quentin Schulz wrote:
> -W is for turning warnings into errors, --keep-going to make sure the
> whole documentation is built and all warnings will be printed before
> failing.
>
> Since there's currently no warning, it's time to introduce it!
>
> Signed-off-by: Quentin Schulz <foss@0leil.net>
> ---
>  documentation/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/documentation/Makefile b/documentation/Makefile
> index d40f390e2..996f01b7d 100644
> --- a/documentation/Makefile
> +++ b/documentation/Makefile
> @@ -3,7 +3,7 @@
>  
>  # You can set these variables from the command line, and also
>  # from the environment for the first two.
> -SPHINXOPTS    ?= -j auto
> +SPHINXOPTS    ?= -W --keep-going -j auto
>  SPHINXBUILD   ?= sphinx-build
>  SOURCEDIR     = .
>  BUILDDIR      = _build


Thanks for the nice improvement. I tested that it builds the "html" and
"latexpdf" targets just fine, but it aborts with "epub" as follows:

writing mimetype file...
writing META-INF/container.xml file...
writing content.opf file...
WARNING: unknown mimetype for .poky.yaml.cache, ignoring
writing nav.xhtml file...
writing toc.ncx file...
writing TheYoctoProject.epub file...
build finished with problems, 1 warning.
make: *** [Makefile:35: epub] Error 1

If I understood correctly, this happens because the .yaml file is not
understood by Sphinx, as explained on
https://github.com/sphinx-doc/sphinx/issues/3214. However, I don't
understand why this only happens with "epub" output.

A workaround is to disable warnings for unknown project files:

diff --git a/documentation/conf.py b/documentation/conf.py
index 5a2e25f7b2..6c6458fed7 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -92,6 +92,9 @@ intersphinx_mapping = {
     'bitbake': ('https://docs.yoctoproject.org/bitbake/', None)
 }
 
+# Suppress "WARNING: unknown mimetype for ..."
+suppress_warnings = ['epub.unknown_project_files']
+
 # -- Options for HTML output -------------------------------------------------
 
 # The theme to use for HTML and HTML Help pages.  See the documentation for


Would this be acceptable? I hope so, because I believe having your
changes would be useful.

Cheers,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

