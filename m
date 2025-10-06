Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F040ACAC5B8
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 16:28:14 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web11.142.1759768087705327412
 for <docs@lists.yoctoproject.org>;
 Mon, 06 Oct 2025 09:28:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JQ2mEDPh;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-87499a3cd37so38849026d6.3
        for <docs@lists.yoctoproject.org>; Mon, 06 Oct 2025 09:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759768087; x=1760372887; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sRVFAW3DCGIjVCjUR5VwS0ExSpEpgJWxbo/bnuiVmtw=;
        b=JQ2mEDPhg6QA589BKpNquUVXI9yxJWNO5pNUqWuZB59rNoy7G1VafIDCOjSbatXbwG
         VSOfxNoiBQdg+gpzM9rDNZBHIK6474dptQSZINpwxjeeMMkPS0Vw+oYi5NvTYmXxRmCR
         uvKn56sowhN2ghqZEK5aKF432ldBkc81u/C6o6b4POQbH173mQsFh+PsNKmTSsAJ965c
         TmBn+hrBoPhemPxHTDWQ0xPh+ooqSEA8eThTpLAaXfREozb6Xz3/R7xtEdu0+T/mSCTY
         /99iQIAMcNfGeOo8Tt3/iVBtCFHnEsVS2nAYYp4zrcszkgwFW/Bluah725rTztxD5a9U
         ne1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759768087; x=1760372887;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sRVFAW3DCGIjVCjUR5VwS0ExSpEpgJWxbo/bnuiVmtw=;
        b=fBPAzvaV67+LIjxNIUeZifytwAW2vICrkUl9EnAfO1dybfZg5bXvNDyNT5h4llRu0l
         gzXUhruhjZlENbRqahfFBWfwpYYR+TVLnj3bxY8lIoViGxhs6MI6itxpC5aYhnGJPBuF
         1AAhQ2EuwKS+pOMsKRVo/84EVnaSfEyMoooR5JhRuGPlW9KzuRf+mQpWRjPWuF2LiZBn
         TxWX2exwg5tt/vaezs0I2FqFUY4O1lQc3V/fFwlTa91XNKP0wMJgiXW0DsTjG2J8tUs3
         Vbl4l/2FDKwXvpaOtrfvpsM8wE4c1iGSiu4KviXnGc5VZnMeqLkUXxuvCstJ4iE/1iyD
         vPSQ==
X-Gm-Message-State: AOJu0Ywsud4jL4jfW1m63C2NdQyg6DKQEh7Rv2qjlo4Ffp19YvTSsuEu
	7KFpNki4yquN0ebPB0edDtmFIRtSgtPu1BCz56LYD1WwOkAU2Z578ehz+7FwHT8vO3Bb17a/NzX
	Lx9V8UJ4noDE4rbsoM0hxq1+ZWlyX9ug=
X-Gm-Gg: ASbGncuSuBSaiqV1yxyjzY2xOzGVcPWHw1NkQG1aznYfn83eqUKB6ELmIOisQTKrSjI
	bsmGPU/9TaI+4ZelGuGsLy/2fzTTfixZRCyBK5fWo5SLK+4q+hgqJwbeT7xpzqW2ZYIp2uzMtX1
	Pt1bZi7jk8bWuUEUwdsdgXj5Rb731WY7M3T1//L+qIRgLi4Z7iw7t6FS+kiKKm21SLFQDPDC674
	BG+b6rFtCUL+cJXp4U3CoIE/MA8uowMDy/bE26ZNf4FXw5tzIo+TTsoiEXEDJdp6asSW7kGljrE
	hE+N2rvvC9sJLqN6a1b+4tSusfgL/h9gcuhry3tSf10NZbFvLjzWcmWnzQXRdi8LgUax72Gn2qc
	=
X-Google-Smtp-Source: AGHT+IG2C4fnuPNeIAihS96Njj75MYUtEVnteUIUA7FLY1nVyH7u9Yfq10YcOpIdvqnuRefOPACylAxOFMupzeVlg/k=
X-Received: by 2002:a05:6214:202c:b0:86c:7f02:ac62 with SMTP id
 6a1803df08f44-879dc88761fmr186869656d6.54.1759768086703; Mon, 06 Oct 2025
 09:28:06 -0700 (PDT)
MIME-Version: 1.0
References: <20251006134757.36206-1-alex@linutronix.de> <DDBDFWFF5Q1P.3I70CPJOP6EO1@bootlin.com>
In-Reply-To: <DDBDFWFF5Q1P.3I70CPJOP6EO1@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 6 Oct 2025 18:27:55 +0200
X-Gm-Features: AS18NWCHrrmibkgTG4PKBgCe6hhsLVwWnWsgnSXYXv8uM7Gb9uqwbyJOzSTshoo
Message-ID: <CANNYZj8NSPGDX=Mp9Cn2+CjgpVTuRYWkApPr1zk1Wjb+mMq98A@mail.gmail.com>
Subject: Re: [docs] [PATCH] ref-manual: correctly document the difference
 between auto.conf and newly added toolcfg.conf
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: docs@lists.yoctoproject.org, Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 06 Oct 2025 16:28:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7660

On Mon, 6 Oct 2025 at 18:14, Antonin Godard <antonin.godard@bootlin.com> wrote:

> We also need to update the auto.conf reference in the fragments documentation.
> Do you want to send a patch?

I am unable to find any other auto.conf references, other than the
ones the patch is fixing. Can you point me to them please?

Alex

