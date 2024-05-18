Return-Path: <amurray@thegoodpenguin.co.uk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87367C25B74
	for <webhook@archiver.kernel.org>; Sat, 18 May 2024 14:13:41 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.19561.1716041621069162706
 for <docs@lists.yoctoproject.org>;
 Sat, 18 May 2024 07:13:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.s=20230601 header.b=eFabe0XY;
 spf=pass (domain: thegoodpenguin.co.uk, ip: 209.85.214.170, mailfrom: amurray@thegoodpenguin.co.uk)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1ec69e3dbcfso38712735ad.0
        for <docs@lists.yoctoproject.org>; Sat, 18 May 2024 07:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20230601.gappssmtp.com; s=20230601; t=1716041620; x=1716646420; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kgkqzBVt0e9+eFEAu1JW+RNCGWqm5QetmpUJmacbPlk=;
        b=eFabe0XYMlas1uGSG6AwYrRVyIV17FEA/R+2SiTsJsKvBwcs1AJnCYh2jFERhAeA+4
         jA525l4CbqgAnvMKoKpZmnzjjI+n7Brsxis+NR6JlIfYBNJikAFfbB5Vd848r74QNecO
         J4aNtkgkw2OAbNf77o6MgWcXTHoEK+2YHSdrH+uJ1F/w7qc8B2qRjhBIdHWWE1ITWj5+
         zCymXHG9y576cxUJkfE+JxVD+IW31YRnjcXox6R0HULtqooLgkti9YZeHY2k6A7jX0dd
         Rp789HJpvmdA+2q2v8JNXwkrxX4a6D75ICuMRvDWCuMJA8ASeQgQuFh1W7lXnkcDxZVx
         TgaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716041620; x=1716646420;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kgkqzBVt0e9+eFEAu1JW+RNCGWqm5QetmpUJmacbPlk=;
        b=Mr5Rp6VsaysJ292OzzTk9WrlG6HrKPmZautaEab1J7D5K2wCmYz8ke1DxgBClMa8yK
         U9hfh0UIGrKFSsHjG+qZxBD32LH+7g13OFmNITrBsnmdt+zk2H/vRB06IIhU6W+KWlVf
         OkqDivz/kQtZ3xfgC5zeKsveUrk81cQGYrTyIZZelZY5begFsJ/gPME+InvUGFpw7pRN
         zFvJf3jZiQd36hSWj48hJsVn0bVxDi2P9vtU9cl/8FCt9IenB+UjW+65k9+pLZEKDmOj
         38At6dJivwL4gacltyKly547UYzRqRWmoU4wux3fpTr9E3QqQ1tHVR2ubVMSjn25yl7F
         GCcA==
X-Gm-Message-State: AOJu0YzJi+fkBdUeVUUmGQYRol7+hVo2y/MV+edzuTjERznUTtHZ8UgA
	HgMc5s+WeLOXMJjNoC1jbsx6pyv50ph1NRLyTxNNohqGH/ZKq4QlvFBMmjvagg5We7igYo/3UnE
	NsXQQV0a2b5k4wkLuEWbXSo+cu43p3iJ509hPUA==
X-Google-Smtp-Source: AGHT+IG9Yn+LbyXXsrMoPba0zhk3pyUlyazhnoXx2IVJtOAZ/pDTz6gMnjANeenoOMBwK1MUhALjChU1eJrab+8TCBY=
X-Received: by 2002:a17:90a:e383:b0:2bd:460f:8ac with SMTP id
 98e67ed59e1d1-2bd460f0971mr6273291a91.32.1716041620249; Sat, 18 May 2024
 07:13:40 -0700 (PDT)
MIME-Version: 1.0
References: <20240517192724.7519-1-ngalea@thegoodpenguin.co.uk>
In-Reply-To: <20240517192724.7519-1-ngalea@thegoodpenguin.co.uk>
From: Andrew Murray <amurray@thegoodpenguin.co.uk>
Date: Sat, 18 May 2024 15:13:29 +0100
Message-ID: <CALqELGx08ZepQTyioRKPV3pi-4tX+oxHvgZCYGxrH=pQwpOD9w@mail.gmail.com>
Subject: Re: [docs] [PATCH] manuals: document NVDCVE_API_KEY variable
To: ngalea@thegoodpenguin.co.uk
Cc: docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sat, 18 May 2024 14:13:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5221

Hi Noe,

On Fri, 17 May 2024 at 20:27, Noe Galea via lists.yoctoproject.org
<ngalea=thegoodpenguin.co.uk@lists.yoctoproject.org> wrote:
>
> Add brief documentation of NVDCVE_API_KEY variable, that was added
> in 4.2.3, and emphasize that its use results in lower NVD API request
> times.
>
> Signed-off-by: Noe Galea <ngalea@thegoodpenguin.co.uk>

Reviewed-by: Andrew Murray <amurray@thegoodpenguin.co.uk>

