Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63FF5C433F5
	for <webhook@archiver.kernel.org>; Sat,  6 Nov 2021 10:05:48 +0000 (UTC)
Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web11.17409.1636193146613477197
 for <docs@lists.yoctoproject.org>;
 Sat, 06 Nov 2021 03:05:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com
 ([174.114.107.13]:40390 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1mjIa2-0007ed-P3; Sat, 06 Nov 2021 06:05:45 -0400
Date: Sat, 6 Nov 2021 06:05:42 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
cc: docs@lists.yoctoproject.org
Subject: Re: [PATCH] ref-manual: replace Container Layer example
In-Reply-To: <20211105173318.33423-1-michael.opdenacker@bootlin.com>
Message-ID: <38c3b079-662-2ac1-aa58-c91258e9a73d@crashcourse.ca>
References: <16B4B6058A93F2E8.453@lists.yoctoproject.org>
 <20211105173318.33423-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel8.indieserve.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel8.indieserve.net: authenticated_id:
 rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel8.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sat, 06 Nov 2021 10:05:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2103

On Fri, 5 Nov 2021, Michael Opdenacker wrote:

> meta-openembedded is not a layer by itself, at least
> according to the manual that specifies that a layer must
> have a conf/layer.conf file.
>
> Use "meta-security" as a better example which is
> consistent with this requirement for a layer.
>
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> Reported-by: Robert P. J. Day <rpjday@crashcourse.ca>
> ---
>  documentation/ref-manual/terms.rst | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/documentation/ref-manual/terms.rst b/documentation/ref-manual/terms.rst
> index eccae91a1c..d6f2162c4a 100644
> --- a/documentation/ref-manual/terms.rst
> +++ b/documentation/ref-manual/terms.rst
> @@ -134,10 +134,9 @@ universal, the list includes them just in case:
>        the Texas Instruments ARM Cortex-A8 development board).
>
>     :term:`Container Layer`
> -      Layers that hold other layers. An example of a container layer is
> -      OpenEmbedded's `meta-openembedded
> -      <https://github.com/openembedded/meta-openembedded>`_ layer. The
> -      ``meta-openembedded`` layer contains many ``meta-*`` layers.
> +      A layer that holds other layers. An example of a container layer is
> +      :yocto_git:`meta-security </meta-security/>`. This layer contains
> +      many ``meta-*`` layers.

  being a little more verbose, how about

"A 'container layer' is an OE-compatible layer (in the sense that it
would have a `conf/layer.conf` file identifying it as a layer, as well
possible classes and recipes directories) that contains subdirectories
that are OE-compatible layers in their own right. One example of this
is OE's meta-security layer, which further contains subdirectories
that are also layers, such as meta-hardening, meta-integrity and so
on.

This is in contrast to the well-known meta-openembedded checkout
which, while it contains numerous OE layers as subdirectories, is not
itself an actual layer."



  you know what ... maybe i'm overthinking this. maybe we should just
allow that a "container layer" is any checkout that contains valid
sub-layers, regardless of whether the top level is a valid layer or
not, so that both meta-openembedded and meta-security would qualify.
it's not like the semantic difference makes any *actual* difference,
so who cares?

  thoughts? if this works, i can put together a patch.

rday

