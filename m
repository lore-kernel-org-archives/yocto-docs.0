Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4F83C47422
	for <webhook@archiver.kernel.org>; Mon, 22 Jan 2024 03:12:27 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.65054.1705893138132847507
 for <docs@lists.yoctoproject.org>;
 Sun, 21 Jan 2024 19:12:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ZfMXfRqB;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8CA99C0002;
	Mon, 22 Jan 2024 03:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1705893136;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jyg92eGHbRXvaad4EcZtCTBSDw7JXbxSTmvFEHRuPmM=;
	b=ZfMXfRqBDXEq++C5YS9cgG5jYlMkfzcDtjsGbsDaV2EtKDH3Tkg4ZgMB3M8IGqWf7bt2h7
	M3eqEm8dkFytikfSw2FHQPxFsQbEQktaIhTW4atJNBrnNnqMhsOqxgINrSIBamNIDp7J4T
	z4x5H552/NqMzIAzHQKFCj6WeKxDCd6SQZdGHrchTEAJnZHXEQSOfktXTG/tkjMYxNbJPu
	URWLvi+KzBxaRpDKc/gArE4CpU1bulyEQhy+50PpmNFTNfoleiL99XGtOfIwdALznn0guI
	3GOd7Wtwh+jhpur7c3nFxoKWIbFxmA/SoiKXHur2HrtXw+Yk1FElI4mkoHnDvQ==
Message-ID: <477fcd38-8fc4-48b4-9718-23548c8131b2@bootlin.com>
Date: Sun, 21 Jan 2024 22:12:13 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] installing documentation per the Reference manual section
 1.4.1
Content-Language: en-US
To: mhagans@skyviewsat.com
References: <qBwK.1705773169837336808.wBv6@lists.yoctoproject.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <qBwK.1705773169837336808.wBv6@lists.yoctoproject.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 22 Jan 2024 03:12:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4789

Hi Mike,

On 1/20/24 at 12:52, mhagans@skyviewsat.com wrote:
> Hi all - new to Yocto, going through the process of making my Build 
> Host.  My Build Host hardware is Lenovo Thinkpad X1 carbon (4th gen) 
> with intel i7 processor, running Debian GNU/Linux 12.
> The instructions for building the Project Documentation manuals in 
> 1.4.1 (Debian and Ubuntu) says:
>
> Here are the packages needed to build Project documentation manuals:
>
> $ sudo apt install make python3-pip inkscape texlive-latex-extra
> $ sudo pip3 install sphinx sphinx_rtd_theme pyyaml
> the first install string ran successfully, but the second one gave me 
> the following error, and I don't know how to proceed.
> mike@X1CARBON:~$ sudo pip3 install sphinx sphinx_rtd_theme pyyaml
>
>     error: externally-managed-environment× This environment is
>     externally managed╰─> To install Python packages system-wide, try
>     apt install    python3-xyz, where xyz is the package you are
>     trying to    install.        If you wish to install a
>     non-Debian-packaged Python package,    create a virtual
>     environment using python3 -m venv path/to/venv.    Then use
>     path/to/venv/bin/python and path/to/venv/bin/pip. Make sure you
>     have python3-full installed.        If you wish to install a
>     non-Debian packaged Python application,    it may be easiest to
>     use pipx install xyz, which will manage a    virtual environment
>     for you. Make sure you have pipx installed. See
>     /usr/share/doc/python3.11/README.venv for more information.note:
>     If you believe this is a mistake, please contact your Python
>     installation or OS distribution provider. You can override this,
>     at the risk of breaking your Python installation or OS, by passing
>     --break-system-packages.hint: See PEP 668 for the detailed
>     specification.
>
> Do I override with --break-system or?


Oops, thanks for reporting this.
I confirm that I can reproduce this with a Debian 12 Docker container 
(I'm on Ubuntu 22.04).

However, I found a solution without pip:
sudo apt install sphinx python3-saneyaml python3-sphinx-rtd-theme

It seems to work for me. Does it work for you too?
I'll be happy to update the docs.

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


