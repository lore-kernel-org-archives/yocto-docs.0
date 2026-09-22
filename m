Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35C20C982FF
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 11:42:25 +0000 (UTC)
Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8137.1790077340574531825
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Sep 2026 04:42:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=EIXjubcy;
 spf=pass (domain: gmail.com, ip: 74.125.230.204, mailfrom: twoerner@gmail.com)
Received: by mail-qk2-f12.google.com with SMTP id af79cd13be357-93910cc46c7so385751585a.3
        for <docs@lists.yoctoproject.org>; Tue, 22 Sep 2026 04:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790077339; x=1790682139; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CW4on2yPO/hDpfMoyQwG53dOo8rvxfo3SVXGrCtGQcw=;
        b=EIXjubcyGHXZ0a3lK2/HrQ0jYw/IVqan0JhPWYIFd3lqiTnSu+HKSdM9isgNjvuKNw
         E6x8avI0y+zFLVJ6C51lNFte50Rw5nIzruvoH5sJQ32O8m6gOaFtEnLETzSJs9bzS9Jb
         pj/KRQyRcJYzKQgDV30biAMdUHNbx1FqiCylrqCjWLw8CMHn2Zt2KigXU+K51x//rWk2
         /+VlLu9PKg58vKLJDkmfXayZgRdmA7kIBBnwcc1//x0o0hlXJTGFNL291aPb/4eQ9weY
         N73p5RjZdfVmknIF2YPTelhzySG8hWQwlgRbQxJgwj1WgcqSBQqFyBTd8hDON0EUQsGU
         6Cjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790077339; x=1790682139;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CW4on2yPO/hDpfMoyQwG53dOo8rvxfo3SVXGrCtGQcw=;
        b=L28DWLE6au/qWnish7aaiA3xGpcaelCtbxM5Unfay1f0XzCyWmlgW33Vdz7jPUFZfe
         txKr5uAefums8rfcqncLjIP8PtcqFFtU7mpNoxLnJemi+oBcYejSS3bGMkkIuFjm4sVH
         s4lndCUjTMzUvm/jHCBvuHrLlLZDAXYBgKVCZblMzjVrhZorPUxZAN5Rll74nbVi+Vqe
         6WF28hHVpKg1AAHajqQmiVe61zH2geo6+oE9sGCIs/MXgoUz8rsyU7Z5GcviVs+ak/Lx
         tw1UOXBeQWlR6fZNmtlH6W40H0/g/N/M86ikn5zxgvromzGxks4622pOG9tEm0dbJy6W
         GOBg==
X-Forwarded-Encrypted: i=1; AKwUvBwk2NyhDWC78bYDU7tHn6DL6PINZgwe7PjFs/FUN9bv8GKDPfNu0qf/5NNYO0LzrnO11S+z@lists.yoctoproject.org
X-Gm-Message-State: AFuF++kEflTJgl1Nqm/BVbMP1xNr3MsH5gHxhR2CkpsdFI1AY/dLVvfi
	4wcOjQHTNdz1FUnv+t7GxjfIacUoy1HjoDm8+vHfZ7xhRenSp7BIa/Jm
X-Gm-Gg: AYBFou2RIZd9epy+KLCfUic5L0/crcAfrfQUyD68d2O61/kzhtxz8OhYr6zKy+Ik+bj
	wI4Wdm/dlVulI7T8TD2VLViNvAL5lUEtEnPUjGkgqTYdUlSalABWWKxt4X+6GXhE4aSoguG9gVJ
	oyT9AJgn443sLtpGLzBIa3vbfAIeNdkyaKCkSBRG99fiTRdkl+mfpNSQOLyRM13Y5PWFPqymysK
	qHzNIggLm2vLIfNLs8ZH6EuQ/DkRGk8KQZcJAaOqnbbk5YRTWYx8O7fzTQotwvt8L/iUQXwG86U
	egMMo/qB0FpkcMF07FKn2tkLrylCv2RZ1DuvtbCs8evi1gWRQWa7yWdR07BEpF7iY4t8Rrohpmm
	s7Hl/D1e8TnIO0WKHQQfXxOiwmbDPQ9aA+085A9cPwBiS1GMF2eO2gOHd7c/kU/gj2VER8kvRP1
	37E6dRNYS/+IpYEA/Nd2HSC7sc+IPq1ae+v3nU+E0y6r1zuTIIfh5McWdp+bxYw7h9Nm9Y47bI/
	PmtkvwIgQDGNTCcQRBC61gvgs7ZsgiHGiD9BzVfAOzo2qkfOHM=
X-Received: by 2002:a05:620a:2687:b0:93b:d7a0:d9e4 with SMTP id af79cd13be357-93c19a7e6c0mr297148885a.62.1790077339477;
        Tue, 22 Sep 2026 04:42:19 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-914024a1c24sm13438726d6.8.2026.09.22.04.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 04:42:18 -0700 (PDT)
Date: Tue, 22 Sep 2026 07:42:16 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: Quentin Schulz <quentin.schulz@cherry.de>, docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] docs: document the conventions used in the manuals
Message-ID: <arJpmO3teJhrT5ui@localhost.localdomain>
References: <20260831031458.4070250-1-twoerner@gmail.com>
 <DL2ZCLBWUBX3.5ITP3G3AJ0SV@bootlin.com>
 <apWCaeB2azEgKMlK@localhost.localdomain>
 <92a2c1b9-16bf-475f-aec4-4fffbce0012a@cherry.de>
 <aq4o7Zu-ILYDZnGw@localhost.localdomain>
 <DLL2HTQFFELI.15X26RE9UVCZF@bootlin.com>
 <arHbV_euXtr9_t0x@localhost.localdomain>
 <DLLO5AQ7R6L7.1068CI3MBB0FC@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DLLO5AQ7R6L7.1068CI3MBB0FC@bootlin.com>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 22 Sep 2026 11:42:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10577

On Tue 2026-09-22 @ 09:32:38 AM, Antonin Godard wrote:
> On Tue Sep 22, 2026 at 3:35 AM CEST, Trevor Woerner wrote:
> > On Mon 2026-09-21 @ 04:34:35 PM, Antonin Godard wrote:
> >> Hi,
> >> 
> >> On Sat Sep 19, 2026 at 8:17 AM CEST, Trevor Woerner wrote:
> >> > On Mon 2026-09-14 @ 06:39:59 PM, Quentin Schulz wrote:
> >> [...]
> >> > having a
> >> > prompt clearly shows what are commands to type and what is output. For
> >> > the sake of uniformity I would rather not have code-block examples that
> >> > have and others that don't have prompts.
> >> 
> >> I agree.
> >> 
> >> >
> >> > As for the "what to copy" issue. Every code-block has a "copy" symbol
> >> > that appears in the code-block when you hover over the code-block. If
> >> > the code-block contains things to type with prompts and you click on the
> >> > copy icon of a code-block, the commands are copied and the prompts are
> >> > not. However, if the user highlights what to copy by clicking and
> >> > dragging with the mouse, they will get both the commands as well as the
> >> > prompts. However, that is configurable! It is possible to configure any
> >> > code-block identified as console to not copy the prompts, even when
> >> > clicked-and-dragged with the mouse.
> >> 
> >> Do you have a working solution for this?
> >
> > Yes (to follow).
> 
> Actually it seems to be already working for me. After building the docs, I
> cannot select either "$" or "root@qemux86-64:~#" so things seem to be working as
> expected?

Out of the box you are correct that in the case where there is a "#"
prompt, the prompt is not selected (just the command). But look for an
example where there is both a "#" prompt and output lines prefixed with
# [1], the comment # will be skipped too (not correct). Plus if you test
with the copybutton the whole block is selected (prompt and all).

There are 2 ways of copying: clicking the copybutton, or dragging with
the mouse. Be sure to test both and make sure both methods do the same
thing, and the thing they do is the correct thing.

See patch 2 of my docs-fixes set:
https://lore.kernel.org/r/20260922020339.481929-3-twoerner@gmail.com

The full patchsets that I have (not all of them sent yet) fixes all of
this, but I didn't want to overwhelm with too many patches at once. The
docs-fixes all stand on their own and are good to have regardless of
anything else. The conventions-v2 is slightly out of place,
conventions-v1 really should have only been suggested after all the
others were agreed on, but I felt compelled to send a conventions-v2 now
since v1 had been reviewed. conventions-v3 (to be sent) will be correct
for now if docs-fixes is accepted.

> Antonin

[1] "Basic ftrace usage" in the profile manual, the "cat trace | less" one

