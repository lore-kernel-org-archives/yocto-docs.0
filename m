Received: from bsmtp1.bon.at (bsmtp1.bon.at [213.33.87.15])
 by mx.groups.io with SMTP id smtpd.web11.9334.1622212839760383164
 for <docs@lists.yoctoproject.org>;
 Fri, 28 May 2021 07:40:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.15, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp1.bon.at (Postfix) with ESMTPSA id 4Fs6mj1Gs4z5tl9;
	Fri, 28 May 2021 16:40:37 +0200 (CEST)
Date: Fri, 28 May 2021 16:40:35 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [RFC 1/3] Makefile: allow epub and latexpdf outputs to use diagrams from SVG sources
Message-ID: <20210528144035.e44vng7jmiogfh6d@qschulz>
References: <20210515071219.307241-1-michael.opdenacker@bootlin.com>
 <20210515071219.307241-2-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <20210515071219.307241-2-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Michael,

On Sat, May 15, 2021 at 09:12:17AM +0200, Michael Opdenacker wrote:
> html output is great when directly using SVG
> epub output has to use exported PNG because of issues using SVG directly
> latexpdf output cannot use SVG, it needs exported PDF instead
> 
> This adds rules to generate PNG and PDF formats from new SVG sources.
> 
> Newly added diagrams have be stored in svg/ subdirectories
> so that PNG and PDF files generated from SVG can be "gitignored"
> without ignoring the original PNG diagrams that have no SVG source.
> 
> Note: had to remove the dependency to "Makefile" in the final "catch-all" target,
> otherwise it was also catching my SVG to PNG and SVG to PDF targets.
> Any suggest to avoid having to do this?
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>  documentation/.gitignore |  2 ++
>  documentation/Makefile   | 29 ++++++++++++++++++++++++++---
>  2 files changed, 28 insertions(+), 3 deletions(-)
> 
> diff --git a/documentation/.gitignore b/documentation/.gitignore
> index c44580b088..35ead8af66 100644
> --- a/documentation/.gitignore
> +++ b/documentation/.gitignore
> @@ -1,3 +1,5 @@
>  _build/
>  Pipfile.lock
>  .vscode/
> +*/svg/*.png
> +*/svg/*.pdf
> diff --git a/documentation/Makefile b/documentation/Makefile
> index d40f390e2b..acb09726cd 100644
> --- a/documentation/Makefile
> +++ b/documentation/Makefile
> @@ -6,8 +6,11 @@
>  SPHINXOPTS    ?= -j auto
>  SPHINXBUILD   ?= sphinx-build
>  SOURCEDIR     = .
> +IMAGEDIRS     = */svg
>  BUILDDIR      = _build
>  DESTDIR       = final
> +SVG2PNG       = inkscape
> +SVG2PDF       = inkscape
>  
>  ifeq ($(shell if which $(SPHINXBUILD) >/dev/null 2>&1; then echo 1; else echo 0; fi),0)
>  $(error "The '$(SPHINXBUILD)' command was not found. Make sure you have Sphinx installed")
> @@ -17,7 +20,7 @@ endif
>  help:
>  	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
>  
> -.PHONY: help Makefile clean publish
> +.PHONY: help Makefile clean publish epub latexpdf
>  
>  publish: Makefile html singlehtml
>  	rm -rf $(BUILDDIR)/$(DESTDIR)/
> @@ -26,10 +29,30 @@ publish: Makefile html singlehtml
>  	cp $(BUILDDIR)/singlehtml/index.html $(BUILDDIR)/$(DESTDIR)/singleindex.html
>  	sed -i -e 's@index.html#@singleindex.html#@g' $(BUILDDIR)/$(DESTDIR)/singleindex.html
>  
> +# Build a list of SVG files to convert to PDFs
> +PDFs := $(foreach dir, $(IMAGEDIRS), $(patsubst %.svg,%.pdf,$(wildcard $(SOURCEDIR)/$(dir)/*.svg)))
> +
> +# Build a list of SVG files to convert to PNGs
> +PNGs := $(foreach dir, $(IMAGEDIRS), $(patsubst %.svg,%.png,$(wildcard $(SOURCEDIR)/$(dir)/*.svg)))
> +
> +# Pattern rule for converting SVG to PDF
> +%.pdf : %.svg
> +	$(SVG2PDF) --export-filename=$@ $<
> +
> +# Pattern rule for converting SVG to PNG
> +%.png : %.svg
> +	$(SVG2PNG) --export-filename=$@ $<
> +
>  clean:
> -	@rm -rf $(BUILDDIR)
> +	@rm -rf $(BUILDDIR) $(PNGs) $(PDFs)
> +
> +epub: $(PNGs)
> +	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
> +
> +latexpdf: $(PDFs)
> +	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
>  
>  # Catch-all target: route all unknown targets to Sphinx using the new
>  # "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
> -%: Makefile
> +%:
>  	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

Probably just a note to self but there's now a better chance of me not
forgetting :)

If this ever makes it (there's some interest so it'll probably make it
:) ), I'd very much like to see a `make all` which calls the epub,
latexpdf and html make targets so that I don't need to type all three
when I modify something :) (and it's easier if we decide to upload all
three kinds of outputs on yoctoproject.org).

Cheers,
Quentin
