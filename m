Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0A7BC25B75
	for <webhook@archiver.kernel.org>; Thu, 23 May 2024 08:21:09 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.11945.1716452461190052625
 for <docs@lists.yoctoproject.org>;
 Thu, 23 May 2024 01:21:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DpkQUXMp;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-51f0b6b682fso8039393e87.1
        for <docs@lists.yoctoproject.org>; Thu, 23 May 2024 01:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716452459; x=1717057259; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9OLtppGzoYO+Bg0JzAHrahPmiYGZkRFGBcAIEhCB/wU=;
        b=DpkQUXMpbGme7NtGLo1GugkevemixrxAwKOYRYKn/LdOPZhyroIettknV1pM3Uy+8F
         DVzdqvApMZNGUympbuRlYqlADhvyNFd6iCFU/HaQNAJZcln4863BnSZiqZrx3GyfVVma
         Xr8cZWur8F7EOxGW1AXbgtZbQ8z9mbJQnzHNGjFE9HUVxQNWRN8DqFL05F0WLdIQYd4C
         OXJVeDUjiPERfGpxsdvNxD9a/mj8Px9NgttmWspzt6ZWZU5CHS9E7jA0KwGgf5GQTKmW
         u9YkvB+jVWP2SZAar+IyiszZoWgATlE8pHK/h4/ywQ9dOzQZj61mIbDzDV0Zn6/AYTrm
         WFgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716452459; x=1717057259;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9OLtppGzoYO+Bg0JzAHrahPmiYGZkRFGBcAIEhCB/wU=;
        b=DorLWO0MYMcDpsjHbAESxz/rar/S+d5SvkGENxOqRpJPmrl3O9P5Mcy1qTfnItVfbK
         sRPHvLpN3XmM+QgnTyMIaVaDrEjHuZSpUSQdko1qz+f5FQEQTcV0L345zRa/DW0MfYg/
         Xa2E5OWpf61dhaIth1NCvRyuzq7QgWFrBch+y9ODLLCNxo/EtXasPSLfULMvu/JLwTV1
         siFxPzpcTs24quQajoBreAyLjkUIbbxtg+gmlmSozAxWNL3aZlK2Q9PeXqgpXalHlIzc
         DoyLkxjIARh3HkRZFFF558R5wccFdyT2F8Sdqu0IGobJf7aLI62jGUnQRWHEHgd+jxLu
         zLhA==
X-Gm-Message-State: AOJu0YxdlxNGFvf34Rhg/AuQyk2UDwBBDO3qHc2EivB049xZQmhURY9F
	NKgYG3fQaMGu1HH84+DKlzu8bO+6b3OVq7/e35rJQEsy9LM6o/i9xDb6w+u0/yW67KnNo6N7+yC
	7OMQzf9w9wmr9UxaFFIifecU2m0o=
X-Google-Smtp-Source: AGHT+IEIMM+QD7S8NsiU6TBFZ1UOpCjMJdkeFWS0+ltUYD3B+vZeyJCbVV6Yadxs2jjzKFND2rJX8h65HpSJ+/ViyeE=
X-Received: by 2002:ac2:4acd:0:b0:523:8b4b:8c99 with SMTP id
 2adb3069b0e04-526bf921f14mr3888724e87.37.1716452459262; Thu, 23 May 2024
 01:20:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240523073938.2135-1-marcus.folkesson@gmail.com>
 <CANNYZj_PsT8HBLeH51O_9jDTcLmcKx3Sfk=M8GKu898AV+Zw+Q@mail.gmail.com> <Zk72Tip24pDqVlqm@gmail.com>
In-Reply-To: <Zk72Tip24pDqVlqm@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 23 May 2024 10:20:47 +0200
Message-ID: <CANNYZj-EBbc8tvzyWH2ByaE=___eVBnF3QzMbxENOJZxA+NXvA@mail.gmail.com>
Subject: Re: [docs] [PATCH 1/2] image-bootfiles.bbclass: new class, copy boot
 files to /boot on rfs
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 23 May 2024 08:21:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5232

On Thu, 23 May 2024 at 09:48, Marcus Folkesson
<marcus.folkesson@gmail.com> wrote:
> I think there is a win in using the same method as bootimg-partition
> does.
> Then it is the simple task to switch from a separate boot partition to
> embed the boot files into the target root filesystem.

I don't know. It goes against the established practice for forming the
rootfs. /boot folder is not special.

Alex

