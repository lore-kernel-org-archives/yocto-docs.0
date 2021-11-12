Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9DCFC433EF
	for <webhook@archiver.kernel.org>; Fri, 12 Nov 2021 11:06:05 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.14371.1636715163937143464
 for <docs@lists.yoctoproject.org>;
 Fri, 12 Nov 2021 03:06:04 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id CC0F3240006;
	Fri, 12 Nov 2021 11:06:01 +0000 (UTC)
Subject: Re: [docs] [yocto-docs][dunfell 0/3] Patch review
To: Steve Sakoman <steve@sakoman.com>, docs@lists.yoctoproject.org
References: <cover.1636564016.git.steve@sakoman.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <6e4f7e10-c45d-352b-c292-5900ba657b88@bootlin.com>
Date: Fri, 12 Nov 2021 12:06:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <cover.1636564016.git.steve@sakoman.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 12 Nov 2021 11:06:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2128

Hi

On 11/10/21 6:08 PM, Steve Sakoman wrote:
> Please review this set of patches for dunfell and have comments back by end
> of day Thursday.
>
> The following changes since commit 6e287138eaf1e20ac09bdc31fc91b3fe0fabe3ff:
>
>   poky.yaml: fedora33: add missing pkgs (2021-10-29 17:30:57 +0100)
>
> are available in the Git repository at:
>
>   git://git.yoctoproject.org/yocto-docs contrib/dunfell-next
>   http://git.yoctoproject.org/cgit.cgi/yocto-docs/log/?h=contrib/dunfell-next
>
> Steve Sakoman (3):
>   ref-system-requirements.rst: Add Debian 11 to list of supported
>     distros
>   ref-system-requirements.rst: Add Fedora 34 to list of supported
>     distros
>   documentation: prepare for 3.1.12 release
>
>  documentation/conf.py                                | 2 +-
>  documentation/poky.yaml                              | 8 ++++----
>  documentation/ref-manual/ref-system-requirements.rst | 4 ++++
>  documentation/releases.rst                           | 1 +
>  documentation/sphinx-static/switchers.js             | 2 +-
>  5 files changed, 11 insertions(+), 6 deletions(-)


Merged into the "dunfell" branch. Thanks for the reviews and answers to
my questions.
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


