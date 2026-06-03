Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11F7FCD6E55
	for <webhook@archiver.kernel.org>; Wed,  3 Jun 2026 14:17:40 +0000 (UTC)
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21166.1780496252218018075
 for <docs@lists.yoctoproject.org>;
 Wed, 03 Jun 2026 07:17:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=e0QOkhqV;
 spf=pass (domain: gmail.com, ip: 74.125.82.174, mailfrom: alex.kanavin@gmail.com)
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3074adb8fcaso676154eec.0
        for <docs@lists.yoctoproject.org>; Wed, 03 Jun 2026 07:17:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780496252; cv=none;
        d=google.com; s=arc-20240605;
        b=SQ5wJrK+Xa3UoT9j9VPDbV1IZeFQhO7A0prRjMESjikP7FPQm2Jqw0QxySNTPjITjk
         CsgeP42HALwR5bC29RmbmBUZdKHF+sfLTaDQ300Yjh08uEmN4vpLYkNZdNBVLE3ztYYY
         KncwHkkTm5VdaX0Hu7UlLzqoQNjEuRIJpm1H8n2DDFMvVIcJQUFkcuUxutCz/p26XQj/
         Ix6tCxPdoAvufGTMXZCV3hD7Bf2IA3ngNYaXk0cFpi62GAtCLu/QAEjXIJ+Oiaqw8zO6
         BUH9YWS0G8x8vniJnA8qdx8M5WawNDOXohatwNwbA/0PTqc4phpM+6e6zqr/5OMozCPa
         nE/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yiSvTmurM0ebNR9d5YN3q4WkfXUrtD1zWvQBt29IgqM=;
        fh=w4udndNa3z3dS987rpA732l9rCEUCMDw7O6T9DWWVD0=;
        b=EAFEvmuhhPULIDsN9ojcZNhzv5LFzOuWqE6EXPnEZhASTuxWwVUwoqAKk2q0emSjG5
         IBrH8O5R5l95t6rZlurOolKJYqYtPDOcq/nSdto0y+xisCEeLI4gdsNLHm1dMt3Pmx/e
         hsbr+jG8161rplX4aKSfMi4o468XVfYwlpPSiGacpTw45+xSwhM/9rpI0451TdFllnxW
         7MIhB1bRSwLHPGwjhpT+mtrY5Ho752+QwhrHB7XFDh7psEvpD7QFFlfZJ752+GY7wlhl
         tGEiNVPit3afWHpXoLVBIDAr2pCFw0DT0tzjv22RHvB2VChPS8NReHC/RbG+Xf+npLrv
         YVrA==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780496252; x=1781101052; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yiSvTmurM0ebNR9d5YN3q4WkfXUrtD1zWvQBt29IgqM=;
        b=e0QOkhqV01G9zcYj0NVr48szwKjD52UUzD1RvhVNdfZrT8SZFdbk6/i51csV1YF1rL
         0WyFpszjZR82bqeb4twhJMiJ/Qnc3mOoKPVhlMHhXdFLbXWtDm4cVozh+LuD3b1BHoAZ
         U/F4sUai6MYt2QW4gSBoaZRmjmQ+EKh48X6tX4+bAXRxeM52fQpn399vJ1qB9Wf1R3eH
         hRNCfR4mn6fZUXT76EZ9ReESfYbItz1EW203mADZBqSudGlASgsbOApnW5B0aC+4Rodc
         3vFuWqv6jIngc8PPlrV3lJWpaZLJOgRACnDYwuFMhbNUKZq/H8uWJzzqZKaUO0D6wxZo
         rV+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780496252; x=1781101052;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yiSvTmurM0ebNR9d5YN3q4WkfXUrtD1zWvQBt29IgqM=;
        b=F1P1WRWpDxXUcNWuJ2QRRUREBC1rXS0iusSnUQ7JAC1QbkG7RM0TtqNQyCyLt64IZH
         TXAHfqRhp6HNflpWzLE1gbBEiVivs07MqdJpjw8SVtCKAR6TysH+A+RnxMgxDfK6O/Rc
         yxFHHg5V+tOq7wjxCuJbCjZPuXUqiwFXyHXD4GvzU+o7qaek6uJimoRxRm0cMWK4S9i4
         meoMg6OOXjcYpVrCB6YGlphpHWmAH6AACN3BmcXgbp0bWqUJY++0JdRuAQrDn55Bep7l
         5reYyAFCIDXda0e9l7MIalPt8tVaMcvZeprwcyUOMOerZUUUpfBiWFoNuEtRSuT7uvWu
         /3AQ==
X-Gm-Message-State: AOJu0YyrRuvvFuHPExFcNVLE44IdPV2iW783Jg6/sbSevywD1b4MLIF9
	GhdhPSv0vmw6HU2bZ8RRrf6m+xBUAYXvGwwr5+1zONUycPN+ZNnalvBzt//IsYP1yGl544KYCp2
	mhLQ1KeUuH0xiPvE0w8ZSaQxjwbrDg+c=
X-Gm-Gg: Acq92OE0cWHapefmllr4QvV4KQMn12XX/Y921uV0lyunWksk4YIj+kdZLWpxPMbVi1O
	gfsmKWadVr2v1+5ytru12X3TzCxBzeWk8l/1F06UMScjjlUqAzU79PjVMV7HR5I+N8tIWcb51ms
	SmePpO9fCu5+hpfb7ov1UO08e/dvu6iSZSWv3oUGUYBRcc18FW8U75mzx4P3RrUUrZgk0+Futzi
	HKKvgWsAATOYEMhAMZPiY9F1Q4pTuEm1rjRiwLn3t2vWkygQW92T7w8m9l9WXJc3YoYcsfHl+3J
	/Ts8B22uKDmYh94gIUz+9e4lzm1ncaGWLqi6oNeIrRcKy9SXsnw+
X-Received: by 2002:a05:7301:1f0d:b0:304:dddb:f8 with SMTP id
 5a478bee46e88-3074fc6fab9mr2017985eec.35.1780496251399; Wed, 03 Jun 2026
 07:17:31 -0700 (PDT)
MIME-Version: 1.0
References: <bc5c1023-203b-aa92-b799-3c5fd584d2bc@crashcourse.ca>
In-Reply-To: <bc5c1023-203b-aa92-b799-3c5fd584d2bc@crashcourse.ca>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 3 Jun 2026 16:17:19 +0200
X-Gm-Features: AVHnY4J2FAmrWltZhnv9gnJxDkEklRX5aCdP-IRmobvaPlH92xp4pgW5DEk0qbA
Message-ID: <CANNYZj8eVskSFhvbtuzkQ6ACE1fTnuBpxvHFQS-Rh6RFMbeJWA@mail.gmail.com>
Subject: Re: [docs] why is CROPS listed under "Archived Components"?
To: rpjday@crashcourse.ca
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 03 Jun 2026 14:17:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9561

On Wed, 3 Jun 2026 at 15:20, Robert P. J. Day via
lists.yoctoproject.org <rpjday=crashcourse.ca@lists.yoctoproject.org>
wrote:
> here:
>
> https://docs.yoctoproject.org/overview-manual/yp-intro.html#archived-components
>
> the title "Archived Components" strongly suggests stuff that is
> deprecated or no longer under active development, but that list
> includes CROPS, which is clearly described as the current best vehicle
> for doing builds on a non-Linux system.
>
>   that seems to be sending mixed messages.

Something can be unmaintained, and also the best currently available
option. These are not mutually exclusive characteristics. How would
you change the text? Is there a better option available?

Tim is working on 'next generation' yocto containers, but it's not ready yet.

Alex

