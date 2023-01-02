Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53B0FC4708E
	for <webhook@archiver.kernel.org>; Mon,  2 Jan 2023 12:58:34 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web11.34481.1672664306296061881
 for <docs@lists.yoctoproject.org>;
 Mon, 02 Jan 2023 04:58:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GubmHFgM;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id n1so29001528ljg.3
        for <docs@lists.yoctoproject.org>; Mon, 02 Jan 2023 04:58:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sKL7mUhQikDRxSVEHEKyWsyCHWF2183vOSkrLwpjJE4=;
        b=GubmHFgMtom78yT5Lt8TSWXGQPnIekddYzMV0Oo2VN/7CyXCAiL7JW97UFEoA2Uarn
         d3MPiTYAc8Ak+l4xhkrzaqj+opl/7YgX/M97Fo24dq75lnIBEhd1uT8YlIXgV41y7ZSs
         zqAPs1x7xjlCip/cCe/X0hsrXVmskxvuv2iJJClR2Aohq3CgFX6nLQkczmiQh3cXumeq
         n3F1+6pzFl8rjFqLc+fusmttR+qar53Ed/ydVKSa4bviyslhyopqZmR5JQlG2PNhj5Sl
         ffzGNAqDiXN5oJeWBXkNx5BEW6QfSieZiv3A6MrBKbJYzJz0FBNmbNmXsdBB0an7r/by
         OABA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sKL7mUhQikDRxSVEHEKyWsyCHWF2183vOSkrLwpjJE4=;
        b=IuKUCNcol/VnykvRiBMS+bc8trn1PlXH1NJ55LwBA0xccyGg0LhyuHBN6b+8LFEUpo
         LFnGt2pqjtApTud8A5FUTsI1Uj5406hiN7gFSK2u/NITJ5yYCSO7lRcWWuiXtZPjH1CA
         piegtaSi7xGJLOyzPVzjtgdm4MAz3v3sNrMHhgs3+W2ot9wRpvH8cKYWKXKObw1FZOzg
         jSgg7eZBHJogTyNxX+TpMWvJtSQfsQBRtXUY8jN4cNIdQ/fYPVI6gGhglPr06WEIYctT
         oYyq+dQu00BOHc9+cSBgDekr+Im66JM9RkcsUVmhi/Rps5It2AaaIJzifNcmZN8UL/2/
         P0Dg==
X-Gm-Message-State: AFqh2ko1jfzkxbiiKd1tOOjhj1nSQDbdJvKs/t8+WbhLM8MxyP2cogaH
	UFuIiI0BileWUxDOpCVamTD4BkBODc4OV/s1Miw=
X-Google-Smtp-Source: AMrXdXsSgyH/cma/vyBF+YGvSljA16hrw5NHDUlCZQAmo4gp8HFvWz1+TdwVGvP8T6vLcCAYUeTjHlPBD9DzrK18Vk4=
X-Received: by 2002:a2e:9d4f:0:b0:27f:f286:15e9 with SMTP id
 y15-20020a2e9d4f000000b0027ff28615e9mr237167ljj.403.1672664304367; Mon, 02
 Jan 2023 04:58:24 -0800 (PST)
MIME-Version: 1.0
References: <20221227194932.3783-1-vince@underview.tech> <456184cf-b08c-9eeb-c261-840552bcb5dc@theobroma-systems.com>
 <d3110d81-b0fa-de4a-965a-0c775485e7dd@bootlin.com> <17367770FC1C1495.4716@lists.yoctoproject.org>
In-Reply-To: <17367770FC1C1495.4716@lists.yoctoproject.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 2 Jan 2023 13:58:12 +0100
Message-ID: <CANNYZj_ghrVOm0froyS8Bh=MFf49ocEJ9uFYJnV338SdpCSL-g@mail.gmail.com>
Subject: Re: [docs] [PATCH] ref-manual/system-requirements.rst: support Arch Linux
To: alex.kanavin@gmail.com
Cc: michael.opdenacker@bootlin.com, Vincent Davis Jr <vince@underview.tech>, 
	docs@lists.yoctoproject.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, quentin.schulz@theobroma-systems.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 02 Jan 2023 12:58:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3568

On Mon, 2 Jan 2023 at 11:33, Alexander Kanavin via
lists.yoctoproject.org <alex.kanavin=gmail.com@lists.yoctoproject.org>
wrote:
> Please no. Wikis are a dumpster of outdated information, and this in
> particular will quickly become a source of confusion, which is worse
> than simply trying to build and dealing with issues as they happen.

On second thought, people on distributions not supported directly
should be pointed to buildtools-tarballs of both kinds. But this
should be in the proper documentation.

Alex

