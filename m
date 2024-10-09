Return-Path: <michael.opdenacker@rootcommit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3AC4CEE330
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 16:26:12 +0000 (UTC)
Received: from poodle.tulip.relay.mailchannels.net (poodle.tulip.relay.mailchannels.net [23.83.218.249])
 by mx.groups.io with SMTP id smtpd.web11.21299.1728491164042941242
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Oct 2024 09:26:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@rootcommit.com header.s=hostingermail-a header.b=TqvjyvWC;
 spf=pass (domain: rootcommit.com, ip: 23.83.218.249, mailfrom: michael.opdenacker@rootcommit.com)
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 68F7F8C5DB7
	for <docs@lists.yoctoproject.org>; Wed,  9 Oct 2024 16:26:03 +0000 (UTC)
Received: from nl-srv-smtpout8.hostinger.io (100-96-86-20.trex-nlb.outbound.svc.cluster.local [100.96.86.20])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id C8ADC8C5891
	for <docs@lists.yoctoproject.org>; Wed,  9 Oct 2024 16:26:02 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1728491163; a=rsa-sha256;
	cv=none;
	b=G6/dggeiaqE4elnYtqjoUX2ZDSnvRdGDDlfzR+KHz9tG6JkgMNZplEklerYpbtXvUi7XBH
	QXdextiPv6wLIcx0x0Cx+1DgBAapCYhopajDWkIfdc74nhpqqcDlbVsLsLupeoQghpbafo
	BNrzOAMhxpyxmhUHxmZ7ZWZLwTzXwChDRHYfFs/MLbhjTOc4l+Ki1EG6taX2eyr1ZH4TDU
	V5R8eQFnJivUkDaWbUwM4/n2MagZl2mgkhb6eEZTMjwRpivFfJFv450ad3p7Ic/DPDaffM
	jZ3uXV1WMuUXLHLKDSHwKLes4WpjmW1zoZhqe/0dETtcpOmLE2slf11/c4pmTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1728491163;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=mi5Zlx10qF/9cu7rl2Y4rGNvCyC42KPK6vdm7O97SUI=;
	b=QtvM/lf9iHj8OHpMI7181I9QKWHAvIaegREprabMlmbnWicwL2MwupNe7yB9QQEe9zZHN1
	md0Qfkc327/g/CWTNnOHeSLM8Mpmwcu9Up2Lk1/TGkJWf2j2VszVs3xRLo6p0NBaCp3+qG
	AGHH0ILN9pfiXCAYyUptl7NxnaekIaDbl6QA2KzRKT8XE6eqI8BJfsVEKYQnIYkxIUAI1z
	X1T2MYx5wGn8v8YIqqlRcrBIZ7L789VkdQGPHL2mkiOOGs7mvfUERAM7bPTZJzCBiUnG2E
	rzqrY9GZ0OE8q3MoV3DtPRLiBTy8cNpeKZwrLPMazf/weBtOT3mgVHpLOAjekA==
ARC-Authentication-Results: i=1;
	rspamd-b4cd7f459-5dhpr;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: 
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Shade-Imminent: 585bdff6789e6717_1728491163290_2809981182
X-MC-Loop-Signature: 1728491163290:1591427619
X-MC-Ingress-Time: 1728491163290
Received: from nl-srv-smtpout8.hostinger.io (nl-srv-smtpout8.hostinger.io
 [45.87.82.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.96.86.20 (trex/7.0.2);
	Wed, 09 Oct 2024 16:26:03 +0000
Message-ID: <302be930-e408-4edd-b618-e90f5167fd51@rootcommit.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1728491161;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mi5Zlx10qF/9cu7rl2Y4rGNvCyC42KPK6vdm7O97SUI=;
	b=TqvjyvWCSLQU9aq7Aa4LeVTtodknq3/oe2FYmZTdhY5vFN9ogaqKaQ6a0j7yhF9JsbHZNp
	ERrfSJ8mzPr+5zN/FaJw+Jok3NHwbCOuxjMXEfV+UwvAi15T1iaAHBHaVxG0pjQpEEimfp
	sl14+PL6Bb3/TXKlr9c/XkMYEXk3aQMlZe9QE4Jku7oCCgW8lVsNnBkVKCry96w3jvDLF6
	TR7a12uBYb+16QSVqX9ynZhPQEVmSFylIDtJzJ3jtHP2BHDGAe4nlqFOp2v2rZhVxjZ9hi
	2daRsG09WQolzPEXOa2HBGsZg0MCnA82SuKpjny2GwV6/b93QPtW5OjKTMPJtQ==
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@rootcommit.com, ross.burton@arm.com,
 paul.eggleton@microsoft.com
Subject: Re: [docs] [PATCH 16/16] release-notes-5.1: update release note for
 styhead
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
References: <20241009074120.866786-1-antonin.godard@bootlin.com>
 <20241009074120.866786-17-antonin.godard@bootlin.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Organization: Root Commit
In-Reply-To: <20241009074120.866786-17-antonin.godard@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 09 Oct 2024 16:26:00 +0000 (UTC)
X-CM-Envelope: MS4xfAlzirHPYDXAeQWlx3UgOiPjxjE+nRc0hR12tU1eNeCK5aVr8FzZRSiFBHaUikTXWW6LgWlrE0aiUEHW4f9ODgT1E6yTmEdBP7xVon7KU3mu25x/jyAu fTiygxPSPRAfN7VJis5ANE+DcNlTh5wMgLyYowvfivOrDYMgIhoilfLtxldYSQzRylJquAv4CUSImwYUxZotoft/JzzepUBWWQjnRKEbGR3mxP0jUcDLkaLv pxrNot9Uj4QkC9jgH/6wFYXsb4JtFd1zxtXF5wsrm+zcbsXO6IOykhmFuIEjrRJdVwFooNvCcepD2Nlzk6Q83XQTfoec9zC7BffgRcnbNPEcMq3EWm/mEIB6 X7Q/i/rpkU+YZlcnDKGzxcoSo0LyVTEoXWkhrP7MedzZIPljbJfhkFj4MGsDDeb0WX0+veknn7RhAj2iYBOFBIdLfOq5eLkc74Gr32AOduOub5R9K0weYMHW Q0lz6fHzx3DvTH+6
X-CM-Analysis: v=2.4 cv=bZY5U/PB c=1 sm=1 tr=0 ts=6706ae99 a=FxzzrTkVuG1G0rBnFVKeJA==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=iGHA9ds3AAAA:8 a=d70CFdQeAAAA:8 a=FxY2yspPEeZxfrcL7sQA:9 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22 a=NcxpMcIZDGm-g932nG_k:22
X-AuthUser: michael.opdenacker@rootcommit.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 09 Oct 2024 16:26:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5451

Hi Antonin

On 10/9/24 09:41, Antonin Godard via lists.yoctoproject.org wrote:
>   The following recipes have been removed in this release:
>
> +-  ``liba52``: superseded by ``ffmpeg``
> +-  ``libomxil``: recipe removed as its only consumer, the gstreamer omx plugin,
> +    was removed and has not been developed for several years
> +-  ``libnewt``: moved to meta-oe
> +-  ``mpeg2dec``: inactive for 10 years and superseded by ``ffmpeg``
> +-  ``pytest-runner``: moved to meta-python
> +-  ``python3-importlib-metadata``: moved to meta-python
> +-  ``python3-pathlib2``: moved to meta-python
> +-  ``python3-py``: moved to meta-python
> +-  ``python3-rfc3986-validator``: moved to meta-python
> +-  ``python3-toml``: moved to meta-python
> +-  ``python3-tomli``: moved to meta-python
> +-  ``usbinit``: recipe was poorly named as it is a gadget ethernet driver.
> +   Gadget ethernet is of questionable use now and usbinit isn't referenced/used
> +   anywhere within OE-Core.


s/ethernet/Ethernet/ (twice)

> +
> +
>   .. _migration-5.1-removed-classes:
>
>   Removed classes
>   ~~~~~~~~~~~~~~~
>
> -No classes have been removed in this release.
> +The following classes have been removed in this release:
>
> -.. _migration-5.1-qemu-changes:
> +-  ``siteconfig``:  removed as it was only used by ``ncurses`` and ``zlib`` and
> +   adding minimal added-value for a considerable amount of added runtime.
>
> -QEMU changes
> -~~~~~~~~~~~~
>
> -.. _migration-5.1-misc-changes:
> +.. _migration-5.1-qemu-changes:
>
>   Miscellaneous changes
>   ~~~~~~~~~~~~~~~~~~~~~
> @@ -155,3 +196,9 @@ Miscellaneous changes
>      Environment variables containing relative paths from tested build directory
>      to outside of the original build directory may need to be updated as they
>      won't be changed by `oe-selftest`.
> +
> +-  Several sanity checks from the :ref:`ref-classes-insane` class, such as
> +   ``buildpaths``, have been promoted to errors instead of warnings.
> +
> +-  The ``license-incompatible`` :term:`ERROR_QA` sanity check was renamed to
> +   ``license-exception``.
> diff --git a/documentation/migration-guides/release-notes-5.1.rst b/documentation/migration-guides/release-notes-5.1.rst
> index 211f92553..62aa88f2e 100644
> --- a/documentation/migration-guides/release-notes-5.1.rst
> +++ b/documentation/migration-guides/release-notes-5.1.rst
> @@ -6,109 +6,270 @@ Release notes for 5.1 (styhead)
>   New Features / Enhancements in 5.1
>   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> --  Linux kernel 6.X, gcc 14.X, glibc 2.X, LLVM 18.X, and over XXX other recipe upgrades
> +-  Linux kernel 6.10, gcc 14.2, glibc 2.40, LLVM 18.1.18, and over 300 other
> +   recipe upgrades.
>
>   -  New variables:
>
> -   - :term:`CVE_CHECK_MANIFEST_JSON_SUFFIX`: suffix for the CVE JSON manifest file.
> +   -  :term:`CVE_CHECK_MANIFEST_JSON_SUFFIX`: suffix for the CVE JSON manifest file.
>
> -   - :term:`PRSERVER_UPSTREAM`: Upstream PR service (host:port).
> +   -  :term:`PRSERVER_UPSTREAM`: Upstream PR service (``host:port``) for the
> +      local PR server to connect to.
>
> -   - :term:`RECIPE_UPGRADE_EXTRA_TASKS`: space-delimited list of tasks to run after the new
> -     sources have been unpacked in scripts/lib/devtool/upgrade.py ugrade() method.
> +   -  :term:`RECIPE_UPGRADE_EXTRA_TASKS`: space-delimited list of tasks to run
> +      after the new sources have been unpacked in

s/in/in the/

Again, style is not very important in this kind of file. Feel free to 
ignore these suggestions :)
Cheers
Michael.

-- 
Michael Opdenacker
Root Commit
https://rootcommit.com


