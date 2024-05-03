Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC920C4345F
	for <webhook@archiver.kernel.org>; Fri,  3 May 2024 09:24:17 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web10.8465.1714728252326612176
 for <docs@lists.yoctoproject.org>;
 Fri, 03 May 2024 02:24:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TiMhwiRc;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2e1fa1f1d9bso25283391fa.0
        for <docs@lists.yoctoproject.org>; Fri, 03 May 2024 02:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714728250; x=1715333050; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9M41lk5cM2XMbyFTh8wpGMHGs8TJyXbc8Yn2Vf050sI=;
        b=TiMhwiRcOoovKVa4zDlrepVgPa4CqvrKnQ5XsLhn6h3MZHiaL30LnfPpezKOQwAJh3
         teZVxjzMMDMc/M9pRWrHxT+2avVwDtZ7hQ/VQySOrCbofVwrrkYIMYp0h1I6V6r8Oejx
         AVAZqmqhibA6IYVvBywGEG2vPDsHZJAcrEY3X3muF5SeJWkvil0Rb9FcZJDl11aq0crX
         jtuD7KxIJWbsALBMFwWU0RN7KP0ongeEYgwaySVNVNFk98d0NW0PU71HUQvsXKJZC0xd
         TUBhw9QkAH2ht3Afb4T/VOeJ6/nar2hmYnfa9/3HsKn5yIuonN3Q7RjHf38r1Gx+jQan
         qFLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714728250; x=1715333050;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9M41lk5cM2XMbyFTh8wpGMHGs8TJyXbc8Yn2Vf050sI=;
        b=Kqd0vFxaE8mdw5ApuigrnlneX+fRNAHv/24KxpI6ysmJsrZj4Ggw5Wl64fcTrfCRUw
         5zHAFbPbcq2u+mi5jkpMIOSzgfUpgnQ9I1MUCe84jycfz1sNYUWhZjVqPm9MUYzKFBG9
         0qRUHe/YuO5xqQlDt2CdJCteWnUt30PeHpJJAQSYKEL6X4HryZmtNpF5O6j05nU3Rn2+
         2kL0LglPnxFYr/oH3tr9XLk6x3x49n71c9jweJDTGVZdzEMziuw9VMSPszvxry8fBYkF
         jWqrWuPaCkT9hA33xccgfw3cSjssQkguT0wNOromXsTXPBS6Axt5rJ8/PVa3k1eyMy/F
         EYmg==
X-Forwarded-Encrypted: i=1; AJvYcCXIWyUE+/udq1XIXZ7OVEKqHxlRb4SjpF9WAQYcEYcDI+dENnapSXvHrbRSMtfP9RI/2ebMxWCKWBvIoxIfhtogUb94834FyL0mayI=
X-Gm-Message-State: AOJu0YwuNOu7DcdrWX37WINs83waACxpc4fgNxbPo6B8Nmj/8hT5OUeW
	HpXS+hyMX6Ul2xKNRfG0o0JSvt+di3jZC6O3IjEqMkuyBOq758TA5M1oBopkUWnzQEp31PKVEMl
	ka2D/ICg5uMLhTpO1zN2ppKQBbXY=
X-Google-Smtp-Source: AGHT+IH76CckDhJbHUQpxv93gkVeQiIgjceveRycqJ5UyS3QXgdnrMdkp0XIdeuM0jxkGRYDZMb0Py7WFuUvlqkVH6E=
X-Received: by 2002:a2e:a365:0:b0:2de:ca7f:c849 with SMTP id
 i5-20020a2ea365000000b002deca7fc849mr1622701ljn.43.1714728250159; Fri, 03 May
 2024 02:24:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240502152701.1798568-2-tim.orling@konsulko.com>
 <20240502191839a351b43b@mail.local> <CAJdd5GbY+WkMHOsMnv0U+WOLfOk=FM0OFH=yxqRNMGwxV5cDDg@mail.gmail.com>
 <202405021945001e34cffa@mail.local> <CANNYZj9GuMZFpbCdYd0kQSJ9fK2isT9rDQzpP3P2YzPpD9s8vA@mail.gmail.com>
 <CAOyo-84Y6B9kzzwq6MV9zUs55POsmXzt4uwNOk+YQ14+p1rxCg@mail.gmail.com> <17CBC7546C174761.19168@lists.yoctoproject.org>
In-Reply-To: <17CBC7546C174761.19168@lists.yoctoproject.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 3 May 2024 11:23:58 +0200
Message-ID: <CANNYZj8QQFLqTH8K8_9Go7GnH+J_toPvv9WGUC-S5rkq8tRJhQ@mail.gmail.com>
Subject: Re: [docs] [PATCH] contributor-guide: recommend format.forceInBodyFrom
To: alex.kanavin@gmail.com
Cc: Tim Orling <tim.orling@konsulko.com>, alexandre.belloni@bootlin.com, 
	Joshua Watt <jpewhacker@gmail.com>, docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 03 May 2024 09:24:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5212

On Thu, 2 May 2024 at 22:54, Alexander Kanavin via
lists.yoctoproject.org <alex.kanavin=gmail.com@lists.yoctoproject.org>
wrote:
> - git will insert From: into the body when the patch author and
> sendemail.from are not the same (as I set up for myself). It will not
> do this if they are the same, even when --force-in-body-from is added
> or set in a global config. I'm not sure what am I doing wrong, but it
> just doesn't work for me :-/ git is at 2.39.2, so maybe this is fixed
> in later versions?

It's not fixed in later versions. It seems that the force option only
has an effect together with --from on the command line, and otherwise
does nothing. Which I would say is a defect in git, and even if fixed,
the fix will take a while to become widely available.

Does that match your outcomes?

Alex

