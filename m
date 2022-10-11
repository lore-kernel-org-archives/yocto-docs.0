Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF782C433FE
	for <webhook@archiver.kernel.org>; Tue, 11 Oct 2022 10:31:09 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web11.5612.1665484253402348526
 for <docs@lists.yoctoproject.org>;
 Tue, 11 Oct 2022 03:30:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=FPzI8p6+;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 38413100005;
	Tue, 11 Oct 2022 10:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1665484251;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0FZIK+vTz89WpeqR6D0ppiM2vrSoJy/z7Lcmqwm0BjU=;
	b=FPzI8p6+dX9/PyxDSmgx+iY4dMzHDzjKJK79stc8j1dQ71FbwlmRB1NJSekssVOee4V3EC
	PjDctBbCBmNDBChI9cdcjYuHWgxcswPHUwkOGlcEkhgRqXosEPWXVmwlebKNvKj/3yjpRv
	7NI/Q25VSUCEfcj8WZ1U4eKP696mkuxy8T5B8UzQtskr1D++2/TzmRLDo432Q5Y5VlmL3/
	xjur7khvio0sgJv4zVa6KXRNcRVAGKnFCEeoeZREx+565AlM72PDDyfxS+Ongq+B4p/P18
	Adnj2F0MQGBhh7UIUkxj/WFM3ogJpjYAY34Zi7hbIHiPzISGunPbY84ONv5L1A==
Message-ID: <936247d7-5cb0-2ec3-1a3e-15aa647d53c3@bootlin.com>
Date: Tue, 11 Oct 2022 12:30:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 13/34] ref-manual: add pressure limit variable
 documentation
Content-Language: en-US
To: Paul Eggleton <paul.eggleton@linux.microsoft.com>
References: <cover.1665392835.git.paul.eggleton@linux.microsoft.com>
 <d0e6b7661912a5aeedc3e193ff76982cb0fc8dc1.1665392835.git.paul.eggleton@linux.microsoft.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: 
 <d0e6b7661912a5aeedc3e193ff76982cb0fc8dc1.1665392835.git.paul.eggleton@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 11 Oct 2022 10:31:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3349

Hi Paul,

On 10/10/22 11:23, Paul Eggleton wrote:
> From: Paul Eggleton <paul.eggleton@microsoft.com>
>
> Add BB_PRESSURE_MAX_CPU, BB_PRESSURE_MAX_IO and BB_PRESSURE_MAX_MEMORY
> variables (new in 4.1), based upon the supremely detailed commit
> messages from Aryaman Gupta <aryaman.gupta@windriver.com> who
> implemented the functionality. There is probably enough material for a
> proper BitBake manual section (particularly if we can have some good
> guidance on how users should determine the values for best performance)
> but I did not have time to write such a section, and the BitBake manual
> probably needs some additional preamble on tasks / scheduling
> beforehand.
>
> Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
> ---
>   documentation/ref-manual/variables.rst | 42 ++++++++++++++++++++++++++++++++++
>   1 file changed, 42 insertions(+)
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 0c6bd80..e4304d1 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -530,6 +530,48 @@ system and gives an overview of their function and contents.
>         ":ref:`dev-manual/common-tasks:speeding up a build`"
>         section in the Yocto Project Development Tasks Manual.
>   
> +   :term:`BB_PRESSURE_MAX_CPU`
> +      Specifies a maximum CPU pressure threshold, above which BitBake's
> +      scheduler will not start new tasks (providing there is at least
> +      one active task). If no value is set, CPU pressure is not
> +      monitored when starting tasks.
> +
> +      The pressure data is calculated based upon what (recent) Linux
> +      kernels expose under ``/proc/pressure``. The threshold represents
> +      the difference in "total" pressure from the previous second. The
> +      minimum value is 1.0 (extremely slow builds) and the maximum is
> +      1000000 (a pressure value unlikely to ever be reached).
> +
> +   :term:`BB_PRESSURE_MAX_IO`
> +      Specifies a maximum I/O pressure threshold, above which BitBake's
> +      scheduler will not start new tasks (providing there is at least
> +      one active task). If no value is set, I/O pressure is not
> +      monitored when starting tasks.
> +
> +      The pressure data is calculated based upon what (recent) Linux
> +      kernels expose under ``/proc/pressure``. The threshold represents
> +      the difference in "total" pressure from the previous second. The
> +      minimum value is 1.0 (extremely slow builds) and the maximum is
> +      1000000 (a pressure value unlikely to ever be reached).
> +
> +   :term:`BB_PRESSURE_MAX_MEMORY`
> +      Specifies a maximum memory pressure threshold, above which BitBake's
> +      scheduler will not start new tasks (providing there is at least
> +      one active task). If no value is set, memory pressure is not
> +      monitored when starting tasks.
> +
> +      The pressure data is calculated based upon what (recent) Linux
> +      kernels expose under ``/proc/pressure``. The threshold represents
> +      the difference in "total" pressure from the previous second. The
> +      minimum value is 1.0 (extremely slow builds) and the maximum is
> +      1000000 (a pressure value unlikely to ever be reached).
> +
> +      Memory pressure is experienced when time is spent swapping,
> +      refaulting pages from the page cache or performing direct reclaim.
> +      This is why memory pressure is rarely seen, but setting this variable
> +      might be useful as a last resort to prevent OOM errors if they are
> +      occurring during builds.
> +
>      :term:`BB_SERVER_TIMEOUT`
>         Specifies the time (in seconds) after which to unload the BitBake
>         server due to inactivity. Set :term:`BB_SERVER_TIMEOUT` to determine how


Actually, these have recently been accepted in the BitBake manual (the 
patches from Aryaman got accepted after he left WindRiver), though 
apparently with fewer details:
https://git.openembedded.org/bitbake/commit/?id=c014281f72f4f54ec8e681ef2b8e1080de9ab5cf

Shall we submit your updates to the Bitbake manual instead? This way, we 
don't have these variables documented in two different places.

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


