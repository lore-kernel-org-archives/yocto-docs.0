Return-Path: <amurray@thegoodpenguin.co.uk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FCD8C25B74
	for <webhook@archiver.kernel.org>; Fri, 24 May 2024 10:32:10 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.12739.1716546725931845340
 for <docs@lists.yoctoproject.org>;
 Fri, 24 May 2024 03:32:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.s=20230601 header.b=WsgTgWu2;
 spf=pass (domain: thegoodpenguin.co.uk, ip: 209.85.210.179, mailfrom: amurray@thegoodpenguin.co.uk)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6f693fb0ab6so3837381b3a.1
        for <docs@lists.yoctoproject.org>; Fri, 24 May 2024 03:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20230601.gappssmtp.com; s=20230601; t=1716546725; x=1717151525; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Cf7s23ZDPwNXo/OWN9ofKITpxMt5qXfQxmdoq+SpZw8=;
        b=WsgTgWu28FrkNJ47E53XOXzQPT8E5vKXa8CLNW7e51jxp3e8/uF7zt9Q5XEAhCLF3Y
         E7hrJU3sqO1heH1qs2vboW/PcEellz3Ot3KFuK/K3AJpDs5B8kPz8K/XV+bMP/RTwQhf
         dSyo0DeOJSVaPGWK+DcqTRaXFNnmwG7uiQmhoQ78LuE90OitkWbem6KhLCo8RUqg3jq0
         Biip0v8UZahcNQVWHvqZFm3MVMCAjlydU80ogYlOezqcsocPtP9LiSq7h452Fmx10MuR
         ZTKR3o4SXZ2zPr7OOBNL2cLdwjqLIPtwV4qtC7pWSlO65YRp7cYz/AHupMUb6LopMGhB
         7mow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716546725; x=1717151525;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cf7s23ZDPwNXo/OWN9ofKITpxMt5qXfQxmdoq+SpZw8=;
        b=SW7XaTd/nZlOz4R3OjOxFzdEx+KkipV7er+cW0Oly7rKDTRu5IJ/wWMIwY5FaUqgBz
         Rk6duTvZ0nXNo9X5LHclxAAAqP43p1SaG1c+vzyiJPKTH2qVcLRSwyNMeJ8TMQOgJvDj
         PpFsO6RVRRVqBWzd+jtUPZtKKI6vO85tyXMHCJaUN9dA1EboRvTirXOufn/IPXGgMOuG
         0+mPd4R3L8mA+MALt7GM3m/OW0BSErnpIQq6zNchG+dN9cas7WeITxyNzHZQueBr02M2
         Ms3ip1K3F/9xy+pyy53qhJEfCjf7W0r1G6vr2h+xstmLxXiM1PfFGWSAg9nR/fKgBw6c
         nfhQ==
X-Gm-Message-State: AOJu0YyQ7psDb61fRYKHlO5K+j2CURYq0qiYoF1MWRhokd/7f6yVG/rR
	4OgiQZFPWdr03iVDu4dSfBJLUVUsaTollF6lAdVgbCfiCIEjCpTFd3k7KpYZ1QpoX4LsY6CBbqG
	bg0hmvuWInLgslx77GLwMXsEhcucdvkBkO5xfQg==
X-Google-Smtp-Source: AGHT+IFZ+5PAPgTISfLcsn9vbrCBUZDg5tvmtCHO82EiYcXO/1cX/U79aarWtRtLUACA1oJbxDxmL33OXjF2896ejfI=
X-Received: by 2002:a05:6a00:90a8:b0:6f0:bb90:26b9 with SMTP id
 d2e1a72fcca58-6f8f2c576cdmr2300896b3a.5.1716546725277; Fri, 24 May 2024
 03:32:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240524102513.2361094-1-chee.yang.lee@intel.com>
In-Reply-To: <20240524102513.2361094-1-chee.yang.lee@intel.com>
From: Andrew Murray <amurray@thegoodpenguin.co.uk>
Date: Fri, 24 May 2024 11:31:54 +0100
Message-ID: <CALqELGzHtWCj1AzFDAtuzfTbq4WgyJ1zmjNYRf6dDkxdPrEURA@mail.gmail.com>
Subject: Re: [docs] [PATCH v2] migration-notes: add release notes for 5.0.1
To: chee.yang.lee@intel.com
Cc: docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 May 2024 10:32:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5253

On Fri, 24 May 2024 at 11:26, Lee Chee Yang via lists.yoctoproject.org
<chee.yang.lee=intel.com@lists.yoctoproject.org> wrote:
>
> From: Lee Chee Yang <chee.yang.lee@intel.com>
>
> add release notes for 5.0.1 (rc2).
>
> Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
> ---

Reviewed-by: Andrew Murray <amurray@thegoodpenguin.co.uk>

Andrew Murray

