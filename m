Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74528C4332F
	for <webhook@archiver.kernel.org>; Wed,  5 Oct 2022 19:39:52 +0000 (UTC)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
 [209.85.166.45])
 by mx.groups.io with SMTP id smtpd.web12.355.1664998788376448361
 for <docs@lists.yoctoproject.org>;
 Wed, 05 Oct 2022 12:39:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OTfmtD6l;
 spf=pass (domain: gmail.com, ip: 209.85.166.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-io1-f45.google.com with SMTP id l127so11121135iof.12;
        Wed, 05 Oct 2022 12:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=KvXZF3+gad7dv78BbzPNEfW1F+0mLq12xZ4rf1C4YqA=;
        b=OTfmtD6lhkdOSrufa/lUCC6P1fK0Du+/uMKJPLYlyJzYAFIqtPKE9Sjoa8x2aj0TDr
         GO0EZ4+IIFhwjUGa9jpb/51h7qKFmbJn+2tEeuj/NP1FpXeVYkb9SSmkAVTuVtp0l7zD
         6aOdzwJQh/h16WWOnegT3/lCHUBzdfXRxIRr0mu7GcYg8hgWUfBrTir9WOymNiU34iUZ
         ZgljaG0GDfw5lzlN7rm1F4WAkTKpSNVpEVens3ZVr4QLe403DRxOiUc8fjuKM1UqZeD0
         3IV+0pSxyL3VuSdqb5ZONmRwbl3COCVd47glYwQwTOaMsHPelgFwBmkOJr/XLy60j3Nr
         6J6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=KvXZF3+gad7dv78BbzPNEfW1F+0mLq12xZ4rf1C4YqA=;
        b=BFCsmW6jkppWeRPSrl/pTg49CbjWRThoaW85GZEXvry1y3j+kBE9c+r49AT8KXwQM2
         SN2GYS7fslFpdW6gEO9M/6ieQbjzQy6l7oHgNlfSSh0qa+8nSxSfSZk07dhiob69gIek
         teCDcZowLqsHESNdzmrg6KCO+Kl34IG41+SKX1QS09qFQaKiBGmD3VxOwyN3XO8IVzjL
         Jo9+B/F1113fxrVpg0rCo535LpZFegOj6uHn0DAXg6KyGhuvnOWT4eW+apTzRC2Ajyd3
         43THJ+MpT3gplX8TTIwzi6+gNGPn86MDE/JHc0QUP8rQ7q1ocR60GG2eyx2abj/Saei4
         qtiA==
X-Gm-Message-State: ACrzQf3Wkn4sKu+qJG0JFqLQLpbdiht7b9VhmpZG7Rix6iWNmYuw/9cD
	tYgAB/2Ef02Lc7YMgnx62P9sVE/wvreYP8LEVpQ=
X-Google-Smtp-Source: 
 AMsMyM6tUhHhlAPHlOjoAVWhyy8q0v2+baRbr5qtGf1QAaoHjV7UuxJlvRQOlcBoWB20MrKQ2TTDV8uqR/YQ3qiyiPk=
X-Received: by 2002:a05:6638:138e:b0:357:a6c7:e972 with SMTP id
 w14-20020a056638138e00b00357a6c7e972mr634905jad.40.1664998787707; Wed, 05 Oct
 2022 12:39:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220926161657.7675-1-alex.kanavin@gmail.com>
 <ed73ede3-0727-f5c7-cd1e-e10eef94b1a5@bootlin.com>
In-Reply-To: <ed73ede3-0727-f5c7-cd1e-e10eef94b1a5@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 5 Oct 2022 21:39:35 +0200
Message-ID: 
 <CANNYZj9r6VGWCd4kw0Y5J0LgUzCkTYD7eWY_hn-WQQNSmESLhw@mail.gmail.com>
Subject: Re: [docs] Setting up layers in Yocto, the introduction
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org, yocto@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 05 Oct 2022 19:39:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3292

On Wed, 5 Oct 2022 at 19:47, Michael Opdenacker
<michael.opdenacker@bootlin.com> wrote:

> Thank you for the proposed documentation.
> Do you want me to look for an appropriate place in the documentation
> sources where it could be included, and then propose a patch?

The middle section is actually copied from documentation (I didn't
even bother to remove the markup :)

If you can find appropriate spots for the first and last section, they
could be added. More ideas for Q&A also welcome. We're kind of not
done setting the basic pieces yet, as question 7 indicates.

Alex

