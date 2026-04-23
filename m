Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87EB3F99367
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 10:07:03 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16173.1776938816167652579
 for <docs@lists.yoctoproject.org>;
 Thu, 23 Apr 2026 03:06:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=YuSVCDZ1;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 2E942C5EF0B
	for <docs@lists.yoctoproject.org>; Thu, 23 Apr 2026 10:07:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E4E7360495;
	Thu, 23 Apr 2026 10:06:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1936410460A92;
	Thu, 23 Apr 2026 12:06:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776938813; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=qjA/KpSXQvXgmPKDrwZG3N8OhL0fF08NZ2E6kHETfQc=;
	b=YuSVCDZ11ksegynJguhQJHVh/decELUswbDjhHpKZI7xMNDRm2xoeIGaUzCEj8bduNi4Xc
	LkHZbb4zK8I6Rvk5SFVhXKp3NPs+T1V33pgf+ZvK2R8b+YCfh0ETbmp3QjWqh9JmbmfiIn
	C2rnWkPKpullI0Hk8YnFjs2baYqk89UliWN0JMvbe/28CsLTUILfK3Lw+qp6mh7tax/6hU
	pjp7Osj7eY/djORAGWLJ3/c0VAyNg9iEkW3vbrae0izHHywDfNKFkVD+KlyyuBSPUp01AG
	XLHnBl5zL7mLenP+Ef017auIxdwd9sVxHw51AWrgvNLI99gf/RN62wbRkMqlLQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 23 Apr 2026 12:06:51 +0200
Message-Id: <DI0G8KNYXYAA.F9BOAPVRYGY5@bootlin.com>
Subject: Re: [docs] [PATCH] overview-manual/concepts.rst: fix
 do_prepare_recipe_sysroot task description
Cc: <bijak.dawid@gmail.com>, <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <alex.kanavin@gmail.com>
References: <20260422185404.14111-1-bijak.dawid@gmail.com>
 <DI0DP5Y4RTU3.391J7MHDYMI6H@bootlin.com>
 <CANNYZj9_twTzw96bW6fgjRwtWJo7YTrr3=AUJEwQiW=xN76_yw@mail.gmail.com>
In-Reply-To: <CANNYZj9_twTzw96bW6fgjRwtWJo7YTrr3=AUJEwQiW=xN76_yw@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 23 Apr 2026 10:07:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9333

On Thu Apr 23, 2026 at 11:42 AM CEST, Alexander Kanavin via lists.yoctoproj=
ect.org wrote:
> On Thu, 23 Apr 2026 at 10:07, Antonin Godard via
> lists.yoctoproject.org
> <antonin.godard=3Dbootlin.com@lists.yoctoproject.org> wrote:
>> """
>> A sysroot exists for:
>>
>> -  The target binaries (``recipe-sysroot``)
>> -  And for the native binaries (``recipe-sysroot-native``), which run on=
 the host system.
>> """
>
> I think you could make this distinction:
>
> - target sysroot contains target libraries, and associated headers and
> other data needed to cross-build software from its sources
> - native sysroot contains native executables with their libraries and
> other data, so that they can be run directly on the build host when
> that is required by the build process

I second this, even better thanks!

David, a v2 with all the suggestions would be great.

Thanks,
Antonin

