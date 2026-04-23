Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55A86F9935A
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 09:42:23 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15746.1776937337563607877
 for <docs@lists.yoctoproject.org>;
 Thu, 23 Apr 2026 02:42:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=BwS2VLMp;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-8a3b0242631so79125976d6.3
        for <docs@lists.yoctoproject.org>; Thu, 23 Apr 2026 02:42:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776937336; cv=none;
        d=google.com; s=arc-20240605;
        b=P4A0YF8GWJvCVVfCNvCQuVT2VYvQbIHNefMXPpWsoB8B+aVs9BzI+rWJdAAXI2cT+E
         1C9DM9uW8dvB/srleyYMXNZBj3WFZplXUUzy3Jex0CgE8Q9yhQ57WJHf5nE5PsOgi6IJ
         XctMy1drBAJ04/6swom31wfsJYhLMvTEgvQXuz6wYXKin4e6ey057wlAhlFpDxxDMuEx
         T1tCENsOMxOIIx9X+DUonsu7IcqEpL37g81o1B2AjU73jg4qmD+/tsEepgRtf9WJcOGs
         ismnB18IvvIKay/iCuqMavuHrps5jPHzHozi40+ak6mNrQvc8csxgwtj+hcehqdofVdz
         ohzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qLQGMRU/qRqBUPVaI4CeBBMJ8WFVg8ZY1CtBMCn8NZc=;
        fh=ofmJQBqjyg9Y2JTPPGRkGwAG8RHu3/dO8ff4dkwZ5vw=;
        b=Qioj30ZUmTJl0CenqHBvznRbDZHaoYvSc+RpD0x+vbkEIzlNzVso/0yMczHrxV5Xvj
         EKMUzVOjizcoxP2Oaywxagpw0yNAVhuOe+dQh3Jy4ufzYHHY5B5FY4wimilTUrOl6tXF
         NNOON7eReNdlJLH/DojCY+0UtOOZ6iuhzOP1q/blaHONOGnHWtMA/v/pbHfFvp+e6ucq
         vTq3whrhWD8p2XrqyeUFtPKoyI4BFwpLyuI/2z3Mwmvw7cE+5K9IR7m5HOVyC++IIIhM
         FcP+L4Qa3tPV6Y7XZVEWz2DqfZcXP55p3dGFyofEfcvrPK8LsW506Njo+eArkmrQIikA
         vCyw==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776937336; x=1777542136; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qLQGMRU/qRqBUPVaI4CeBBMJ8WFVg8ZY1CtBMCn8NZc=;
        b=BwS2VLMpsDpMHsKfS1YkvMbaqQ3EXSPKeVx/V4pm3hCXXtVqgaYeG1DzN7u4hXxbQq
         8F5OuAGS4NO/Y9SBAm6m9e8DDRBMge16DUPBcJ/npuY4wii6VVvTyWcRIqarjwdSPXno
         DE/dPbLu2XIEo7uVMky5moDMDNcAJP+w2x4wRicI2F0Q79iJzZhyrsCjvvQIHqpx0vz3
         gbygSVsjKy2/yJ6aRKj2ZfSPhXFtu4k5Vq6lUX7GfVAw5NOPIzFOCUdv7Nd/nFsHfOhc
         fgleJ/JTYy+lfQvbGH65Cr/3/oKiVB1sg15PTFKnhl3Cbg0oQuWk6Lh5JAuJmR3aXZva
         Wecw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776937336; x=1777542136;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qLQGMRU/qRqBUPVaI4CeBBMJ8WFVg8ZY1CtBMCn8NZc=;
        b=WK1uYQQn4mW00ievHsAEB3CSAkzZZfgvml5au+vm3/lyTdcOrv5ivH8i1PUK9mq6J5
         MbTnMxktFNyYzdogcCfhvkzPAxWZHuDo/EqLWjIKGzMqc4CY3QbFX23UD+PALcAPc0TZ
         ezRRJqXUbACXGUg5KtCClvojQwwoYBalM3cyu8GBIjcRzpvBsiBEovOMtLz2ug9Q4mdx
         4J8IkDdm1Tfmti1Dm1Y35UT37QJ9UykC/8aBdxixgWtdzLrLYxRNEbv4pkIkhnEi4YGb
         YIyUnCfHg74qG6GL3TJs4u6fy6HwBqUYuna6lF75NoihJPemB6qndqSeuh157vLmDGzc
         BZnA==
X-Forwarded-Encrypted: i=1; AFNElJ+3CjTZ5i7wjS53ixFPg6WaO2IQovKAWfj1UrZlVXltC6T8J0sosSoV2iQ72yQlVm/9HRMv@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yz4sbar+hx1yCu1s2z6ov3HRAfvxt18xx1fLTDAenOkOuVocVhE
	s/9TV4W1qJF2wvvhFy4a54XneFLQ6cmRDWYCB4BXeVe16GjQcgptBZLoPGGr7Lc/kyIkrmVVklN
	oVFzPr0RALEGP1DuEzwPI/Ys8z0afpVE=
X-Gm-Gg: AeBDievKqlKLL7HXNAsDF6slb6yY6Qz6pO+Yc7lnlLkBjEFELpS++GSAocXOKO7OLGk
	rA38G4iT1lPJ5Tgbj62IIADxXZ82ce/CTFzy5Zi2lQJC4zFq2HU0Hp4+7OHeKOOba90ZX1nJLmf
	3Dd60AGNe0+1ChfRFyRyKCgBJXorUxf/ntiPDwxRuho2frS4h5/mfsTz34dwt2RaFJ1h1bvdUcK
	Ftj9hnRZstnN1JT+eM0D5s51GFNttbKIquAPe441mG6AZcAqVFRMvQKx2m1WqtWF07zygUYZGpW
	l/kFxCdwQFzxYOsXNXTDOoO2ZYxev4M2yPfgFXpf+4qFUTJFq7Go
X-Received: by 2002:a05:6214:cce:b0:8a0:7c8:409b with SMTP id
 6a1803df08f44-8b0280f20c3mr410039656d6.33.1776937336484; Thu, 23 Apr 2026
 02:42:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260422185404.14111-1-bijak.dawid@gmail.com> <DI0DP5Y4RTU3.391J7MHDYMI6H@bootlin.com>
In-Reply-To: <DI0DP5Y4RTU3.391J7MHDYMI6H@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 23 Apr 2026 11:42:04 +0200
X-Gm-Features: AQROBzD_Js2m2VuPsjF8XOLJgn4ywe4lhr8z8UqMdOa5Afr0ffnd9tXTG0RcADQ
Message-ID: <CANNYZj9_twTzw96bW6fgjRwtWJo7YTrr3=AUJEwQiW=xN76_yw@mail.gmail.com>
Subject: Re: [docs] [PATCH] overview-manual/concepts.rst: fix
 do_prepare_recipe_sysroot task description
To: antonin.godard@bootlin.com
Cc: bijak.dawid@gmail.com, docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 23 Apr 2026 09:42:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9332

On Thu, 23 Apr 2026 at 10:07, Antonin Godard via
lists.yoctoproject.org
<antonin.godard=bootlin.com@lists.yoctoproject.org> wrote:
> """
> A sysroot exists for:
>
> -  The target binaries (``recipe-sysroot``)
> -  And for the native binaries (``recipe-sysroot-native``), which run on the host system.
> """

I think you could make this distinction:

- target sysroot contains target libraries, and associated headers and
other data needed to cross-build software from its sources
- native sysroot contains native executables with their libraries and
other data, so that they can be run directly on the build host when
that is required by the build process

Alex

