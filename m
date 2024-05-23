Return-Path: <marcus.folkesson@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99511C25B79
	for <webhook@archiver.kernel.org>; Thu, 23 May 2024 07:48:59 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.11554.1716450530232594708
 for <docs@lists.yoctoproject.org>;
 Thu, 23 May 2024 00:48:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LM74+u9V;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: marcus.folkesson@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a59b58fe083so786760966b.0
        for <docs@lists.yoctoproject.org>; Thu, 23 May 2024 00:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716450528; x=1717055328; darn=lists.yoctoproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bdsEsBrgCmRFauL+hyYjj7JxiTz6LzteRu9vw+M2Cqo=;
        b=LM74+u9V0ccdE/r2+g6+cv24v/yRLJU+Z5r+FIvsA1B3Fn5fiUxVvJa4EK+NBYVNPt
         S9P5GpaU/YmgwbKzOayPZw08RTzPL1jtK3so5eKi5+lUYKd91dInS9IlX3IG/HZYGdXb
         AmUelCYMQmZtpPpv8NtWPGXLtsVubC+wu5wvniXAoM2D8oWC9AyVu78UaMSMRxbc7ul+
         iui9V9DcFHmbGU96+rOh2lDjDTeaRe93lINlN+DT0LczfBZ6TefQyuMVwX6ev0+D9Vy3
         1n4r2gtuMuOV9GJ8wrVdAg2FZIC0r0ByrPTAwaDKuyHpNPA1/gYyYOGHuIYI+78TXm+5
         JW9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716450528; x=1717055328;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bdsEsBrgCmRFauL+hyYjj7JxiTz6LzteRu9vw+M2Cqo=;
        b=CNs6Bd3pDMwNo0snjhzYxo/bVjd/pYPerVXdZLvCK0EIeftgsUY9A//aSXWBG6SONQ
         kEut8IjFoQMswtDh/stkLsajaD2eqgFI3LB1+SUK0khXzeQmLiDFi/kuOwftQ4mnWXQk
         DgEkSYG++vExRUwjfuE60pCnYXo7Ti8Ej64NvP6RnbEhUwPClp9Sb8LITBpqcKFJJhxV
         Vvhxtzgx9ohIjceQlecFtzaYaOq14v+hoJ/c4vs5OJB5RKCFsfIMyVt+s/0yhbDqSpl0
         lzmGiQl0215vM/xoGTu/TEScVSfRaxfcTHdsJtYIaganbgTPIZ/JgihYijLaB3Q0nrf5
         5SLg==
X-Gm-Message-State: AOJu0Yz4SPegNYqubrqVD3XT4TSZgdA+SJTYQPo4r1FiY1R8Qq+S5/Gc
	w+LvrrRgyP9FVQmFuNryFhJvPsbPPSIQ5g0qF7LQW/m6ZhQK4Gcr
X-Google-Smtp-Source: AGHT+IGsgVOEgfFgyUcEEqnCFHmYVmJ47khUZg4EgvQVhBT/E88BuNYsmdsUGIOlQiS6KvytEHOMCw==
X-Received: by 2002:a17:906:4948:b0:a5a:6367:717e with SMTP id a640c23a62f3a-a62280d4f38mr246305166b.17.1716450528311;
        Thu, 23 May 2024 00:48:48 -0700 (PDT)
Received: from gmail.com ([85.235.16.11])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a17b0125bsm1915020666b.143.2024.05.23.00.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 00:48:45 -0700 (PDT)
Date: Thu, 23 May 2024 09:54:54 +0200
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 1/2] image-bootfiles.bbclass: new class, copy boot
 files to /boot on rfs
Message-ID: <Zk72Tip24pDqVlqm@gmail.com>
References: <20240523073938.2135-1-marcus.folkesson@gmail.com>
 <CANNYZj_PsT8HBLeH51O_9jDTcLmcKx3Sfk=M8GKu898AV+Zw+Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CANNYZj_PsT8HBLeH51O_9jDTcLmcKx3Sfk=M8GKu898AV+Zw+Q@mail.gmail.com>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 23 May 2024 07:48:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5230

Hi Alex,

On Thu, May 23, 2024 at 09:36:30AM +0200, Alexander Kanavin wrote:
> Wrong mailing list. Also why not install these from regular packages?

Yes it is for the first patch.
The patch series touches both docs and openembedded-core.
I had not subscribed to docs so the patches were rejected, therefor I
resend it to docs only.

I think there is a win in using the same method as bootimg-partition
does.
Then it is the simple task to switch from a separate boot partition to
embed the boot files into the target root filesystem.

>=20
> Alex

Best regards,
Marcus Folkesson

