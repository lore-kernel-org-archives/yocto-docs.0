Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 608ABC83F1A
	for <webhook@archiver.kernel.org>; Mon, 14 Jul 2025 18:25:44 +0000 (UTC)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
 by mx.groups.io with SMTP id smtpd.web11.85341.1752517542995245780
 for <docs@lists.yoctoproject.org>;
 Mon, 14 Jul 2025 11:25:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CO+q9LOc;
 spf=pass (domain: gmail.com, ip: 209.85.219.176, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e740a09eae0so4617768276.1
        for <docs@lists.yoctoproject.org>; Mon, 14 Jul 2025 11:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752517542; x=1753122342; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5XUMgdE1lWXyL6wfcHwv9YssgIliL3ejYovrPnAHX/k=;
        b=CO+q9LOcPpXFdLMe8tF4Xk9Dx5145lFTjFNP+NEtEZkGelgvMoaU5mwBHwd7In1GaU
         IfhcCCKrnxy89E0JFCkULTOzCtwqgDV6eI/1lkKPQJQ3u1tUirJUXpulCTKNLxmKpciK
         K8AiFqdyrun+aYrkej8//+bHFSfj3sGZsPfH8yMT4DKF1hRKVuo5CRy3mnplOFbsqfso
         GkQA8wFKBaxOxi12t5+PulMV8eIbDl8+2EX3AvVMqGl6zyBODm54+UlOQPAjr0u/gKpJ
         IEHSoev352bCKFsdMVcYytuKCUHqZ9hHUpNEk6GrjPoGUmbQqtQ9ZDd8MFhQom2PLA0V
         4/bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752517542; x=1753122342;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5XUMgdE1lWXyL6wfcHwv9YssgIliL3ejYovrPnAHX/k=;
        b=GRQhmKWMDM4zyzbpDUfascDraRCI8IzHMQQcbMFfT1VVhNxjZVW4UU9/V9HjtclS17
         jvBp5ihdjUGvjjVL2wDa9o4D0dhN1H8qK68Ig64tiaHhiB9BPaDShsp0k4b207lJXt+V
         lhutc2h5MpjcH+Y6Re10xBYyEMNwvTdEb3pyXVQ3svTJtgNcvXjG11V/iRzri1XBxsWu
         BOn/kQKF0LuS9WEpRIm5d1vzR3DEB3BejGKHGTUexy2Az3evJgIM9PG2M73NVviNcLSZ
         8hzNGYmeiQsUtqA5EjwWA3yVyh7Wyxg+ZLsYiP/xQv6GwmEky1wNB85pgKI31XIXQ5Oj
         8+Lg==
X-Gm-Message-State: AOJu0Yx/p96eQHHrsG0Kn5GMv8WzDcccACvZp+8L/ETz2oHywVSFMIqa
	ys+n9llj1jnFQJcZlubZxfcniJTmWDA+36AjVWQdy1XcV+DXgFq+rVNaeXKdEZW3/WuoJCkNMIC
	0gM0kNNNRNFZcQOCbPoCRBcVruDGTopfYDynl
X-Gm-Gg: ASbGncvwU1l1rwujKc48FLOusKUx+grV8syB2D0CZ6EuNNKzHzaQ3peURCWMAWHBbS+
	CEr6J3qxfYi00rWOSyvO6y04wZeb4MZ/rZCbq0Cnzt85ph7XON/7SoXg5MOe4SyzrFgTSGCqZtS
	T2flq+p1ZoqjBP93ZHSEPa7kE+v+hNYAbAHPoZwTZATrnUXEZfH2kWaWVJJ7XP8gNXUI+uFKDIU
	sAftaUPtGgX/WGvYmL40iFPEWhSTrJc2jc=
X-Google-Smtp-Source: AGHT+IH5Uk+ppj0ffW8smqc36lInUvhy+kXHZu8kjs2iLIBoqG2vm0/1XDSsP77/zEMSPlMRsq0uQnzA/S0HBa8MhWQ=
X-Received: by 2002:a05:690c:6806:b0:6fb:b37f:2072 with SMTP id
 00721157ae682-717d5e8f10cmr211573227b3.22.1752517541941; Mon, 14 Jul 2025
 11:25:41 -0700 (PDT)
MIME-Version: 1.0
References: <3115a61f-25c2-5be5-d221-3b28314f07c1@crashcourse.ca>
In-Reply-To: <3115a61f-25c2-5be5-d221-3b28314f07c1@crashcourse.ca>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 14 Jul 2025 11:25:15 -0700
X-Gm-Features: Ac12FXwSLBcgPqSpEyNqLh0bcSxAqECLVwpbrfe_8YV2Cyr-UWpWamrLbj8aYfw
Message-ID: <CAMKF1sr=FxYFe93CS33SDGuq2JPreEjA1spXhaPe8ekTc2XUiA@mail.gmail.com>
Subject: Re: [docs] pedantry: what is the proper descriptor for :append,
 :prepend and :remove
To: rpjday@crashcourse.ca
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 14 Jul 2025 18:25:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7328

On Mon, Jul 14, 2025 at 9:59=E2=80=AFAM Robert P. J. Day via
lists.yoctoproject.org <rpjday=3Dcrashcourse.ca@lists.yoctoproject.org>
wrote:
>
>
>   I ask as I have seen documentation that describes those three things
> as "overrides", apparently because they appear in the same place as
> variable overrides, but that seems wildly misleading. It seems that
> they should more properly be classified as "operators", and if that
> was the case, I think some documentation could be made clearer by
> distinguishing between "operators" and "overrides" when you see stuff
> like:
>
>   VAR:append:arm
>
> that sort of thing. So what's the proper descriptor for those three
> things?

variable:operator:override

>
> rday
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7327): https://lists.yoctoproject.org/g/docs/message/=
7327
> Mute This Topic: https://lists.yoctoproject.org/mt/114151467/1997914
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [raj.khem@gmail.=
com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

