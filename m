Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AE98C5CFCF
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 08:58:52 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50603.1786438730776803911
 for <docs@lists.yoctoproject.org>;
 Tue, 11 Aug 2026 01:58:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=kexWzHVT;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ydbF1NLI/0NtYH9mnKUdDUV/wPqkGxjfB0IRTWO7T9U=; b=kexWzHVTZw+kDllJraLTBjoxkk
	oGBUobtW06QiNcvDaAV8txOyTr8mYaVGNIxV+MhZQoUKBu1UkGTKNXKl5czdKkOpn5q3tQy3J3vPr
	0a5PpF/wtu8oiU9x1dqQcbzjI+QyNgT2HPcgHc4XOxFPY+gIavuciO8pUfNrhGPSISall/0xtV2q8
	H6mJhkB+3T96tyh9L79bXuwwAK7JRfqOcVbFkcPadFz1jQRPaw74XrtkNCj52JZKgWA+wUS2rATYV
	3ssODU03EoHEpd1VBANAjt8rD7HE1GZeFPTA/ZA2r58iiAeQogyuUG4I0Ms0cdLFEoPZloNx4tSkZ
	z5mgaOYw==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:53628 helo=sheena)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wtiJq-00000007TJr-0Ez6;
	Tue, 11 Aug 2026 04:58:48 -0400
Date: Tue, 11 Aug 2026 04:57:26 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH v2] security-manual: Add information about how
 security is handled in builds
In-Reply-To: <20260811084903.3570050-1-richard.purdie@linuxfoundation.org>
Message-ID: <6f5b5c7e-c18e-9843-05d9-a6825504a2de@crashcourse.ca>
References: <20260811084903.3570050-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 11 Aug 2026 08:58:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10252

On Tue, 11 Aug 2026, Richard Purdie via lists.yoctoproject.org wrote:

> We have no information about how security is handled within the builds
> themselves. Start to document this.
>
> [YOCTO #16102]
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  .../build-process-security.rst                | 49 +++++++++++++++++++
>  documentation/security-manual/index.rst       |  1 +
>  2 files changed, 50 insertions(+)
>  create mode 100644 documentation/security-manual/build-process-security.rst
>
> diff --git a/documentation/security-manual/build-process-security.rst b/documentation/security-manual/build-process-security.rst
> new file mode 100644
> index 000000000..1335e1d08
> --- /dev/null
> +++ b/documentation/security-manual/build-process-security.rst
> @@ -0,0 +1,49 @@
> +.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
> +
> +**********************
> +Build Process Security
> +**********************
> +
> +The :term:`OpenEmbedded Build System` is used to run the builds and careful
> +consideration has gone into how it does this with the aim of being both secure
> +and reproducible. Like any system, it does need to be used carefully and in
> +keeping with the design for that to be true. Users of the system should
> +consider that:
> +
> +-  The builds generally aim for any input into the build process being verified in
> +   some form. For source code tarballs, these would have a checksum. Git source
> +   trees would have a specific git revision. Metadata would also usually be
> +   under source control and also have revisions.
> +
> +   See the
> +   :doc:`bitbake:bitbake-user-manual/bitbake-user-manual-fetching` section
> +   of the BitBake User Manual for more information.
> +
> +-  Some elements that can influence the build are not verified. It is assumed
> +   that the operating system running the system is secure and of a known setup and
> +   version. The system goes to signififant lengths to isolate against host

                                  significant

> +   contamination of the output but it is certainly possible, especially maliciously.
> +
> +   See the :ref:`system-requirements-supported-distros` section of the Yocto
> +   Project Reference Manual for more information on supported host distributions.
> +
> +-  The builds assume :term:`DL_DIR` is a safe location. Once things enter that
> +   location there are not repeatedly re-verified. A user could edit the git trees or
               ^^^^
               they?

> +   tarballs there in ways the build might not detect.
> +
> +-  The builds assume things from :term:`SSTATE_DIR` or from a configured sstate mirror

  The catch-all word "things" in various places should be replaced by
a more specific phrase relevant to what is being referred to.

> +   are safe (with :doc:`signature checks </security-manual/sstate-signing>` if configured).
> +
> +-  The core build tool, :term:`BitBake`, is a execution engine and will execute code both
> +   during builds and when parsing recipes. This is not a security issue, it is an
> +   essential part of it's function and purpose.
> +
> +-  :term:`OpenEmbedded-Core (OE-Core)` is well tested for reproducibility issues but other
> +   layers and their recipes and code may not be as well tested. Those reproducibility tests
> +   are available for others to run against their own layers and code.
> +
> +-  The builds combine many different software components and we take it on trust
> +   that there aren't issues in those code bases. We'd recommend build environments
> +   being setup in such a way that if such an issue were ever discovered, which at

            set up

> +   some point could happen, the build environments themselves could be simply
> +   destroyed and rebuilt cleanly, i.e. they're disposable.
> diff --git a/documentation/security-manual/index.rst b/documentation/security-manual/index.rst
> index a767cd9c6..ab1ef445c 100644
> --- a/documentation/security-manual/index.rst
> +++ b/documentation/security-manual/index.rst
> @@ -11,6 +11,7 @@ Yocto Project Security Manual
>     :numbered:
>
>     intro
> +   build-process-security
>     securing-images
>     vulnerabilities
>     read-only-rootfs
>

