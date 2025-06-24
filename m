Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39333C77B7F
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 09:13:17 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web11.4282.1750756396813919809
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Jun 2025 02:13:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UboMdj3d;
 spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4a5903bceffso1994351cf.3
        for <docs@lists.yoctoproject.org>; Tue, 24 Jun 2025 02:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750756395; x=1751361195; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IIo494JAs/kiPtgCc76WJEp9G2jTaRGF3AsuwX+zkNQ=;
        b=UboMdj3d7Qb0PRLYDF+lG1fHoqp7TwxPLxDlLc6o5LRS8VSQnFcI3rQqUdrlauwsrO
         i2BeTMx9hbzdXx/Zojrh4s0mKvKN8MZYLqX1ljyIpBEE+amr+A2M7vaQXBfcJL995R0W
         fZUrHI+6zcte4eNXGKKz/WC6rZxDDpE1UXAA+CHM61YH6aRcdUuNiaxUDxvTvYhgbGj4
         UaorBDH4ve6z/s3+1Zr2IKC3lhxtZawccWKjbeNNVXG64L7XkI/3HJOGd+ro622sssjn
         aXa5PqXe74ZySTNkfgnmtJoRW+btwWfmMGsKRinQIJ+GEMQXvmUmFpbiYVrW7R/7nt/a
         EsJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750756395; x=1751361195;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IIo494JAs/kiPtgCc76WJEp9G2jTaRGF3AsuwX+zkNQ=;
        b=VJeqmuNqSAucaI0sQsOHxI5JmKZi7uXa2yd5mHk0LRgHTd60pPOUzSldQwl9dqJVx2
         2TivKAC0wejYBuEGfdx5wLqvbhXfdUp77sRDb6TstsXXMqbJKugPHEe4uY8T+qrDyv7D
         qqEamMMzr6YugHGVZfdkmiOraRmooS0Q+/Z9h1Q8b2jgUvJn+dylTYpkm1r4ElByje6H
         LUUOIIHKGZXol2fCyRILxuxe/2n8fzlwXwTCKl2/Ray2Um8tjUnqRfppavOn98ugxtme
         ymB6eVLjGuzmshCEtttExDO9TO1jYgbpBVQvOliwLcdoWW6+4r6mfSFJqMzcPF3rumQT
         dVtQ==
X-Gm-Message-State: AOJu0YzCNq+i1lsEZBsNpVodGd8wSVXGK+FiNtkE1/jRtQEVbM99RbS0
	UiXcP+a3ozWQdaxQ8qV80pVtmcddqLwL0QVLrI1iYIW2rJ9okXr5mEA1oC5Y9sr9ZH3TNDF0DAn
	a8Wm455vvDbXEBZWzxBCvVCHRSc3sf3w=
X-Gm-Gg: ASbGncv6LENVtVwVLrwryvmvKjU/JuymmkbAs/kEYZW4wczWM/g0a2ySEOh0YEIszN7
	qWVL68+srD1+ZWvp8FGdvFc6R2IV2ahDq+DJin8lJz7kuYVV9aAWLrHoizH/viERjd0rhvcoBxh
	3kNTzMHS5Or+cbUwBoTWnV56sBV7vtVAJhfUEXWuzAFZXAdJcmKnog8CYa0Ej3Sz+lzXnVypoal
	TfDRQ==
X-Google-Smtp-Source: AGHT+IHFpyFLA8OExxtV7BsGV3xsrLDGcm0bs+UD9lkMTeJWZc+sPN99aDkVzE+uINAIX6X0bUVxCZpduRSMQrmhgds=
X-Received: by 2002:a05:6214:3f84:b0:6f8:bfbf:5d29 with SMTP id
 6a1803df08f44-6fd0a45620emr316526346d6.5.1750756395484; Tue, 24 Jun 2025
 02:13:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250623124257.1544615-1-alex.kanavin@gmail.com>
 <20250623124257.1544615-6-alex.kanavin@gmail.com> <DAULFYRC7Q5D.40A7W0LFM2UV@bootlin.com>
In-Reply-To: <DAULFYRC7Q5D.40A7W0LFM2UV@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 24 Jun 2025 11:13:04 +0200
X-Gm-Features: Ac12FXwlwpwjUwncrKDCVzMdCmirj_oPkNQ3dU4y1vbCokPl2ZKU9RothYcdmF8
Message-ID: <CANNYZj8epgeDnSNQmEjez-m5ixwGe4xm=0xQFqn-2=R4=xh_VQ@mail.gmail.com>
Subject: Re: [docs] [PATCH 6/6] migration-guides/migration-5.1.rst: correct
 S/UNPACKDIR patterns for file-only recipes
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: docs@lists.yoctoproject.org, Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 24 Jun 2025 09:13:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7196

On Tue, 24 Jun 2025 at 09:43, Antonin Godard <antonin.godard@bootlin.com> wrote:

> The series looks great, thanks.
>
> I think we could also mention it in migration-5.3.rst, and also mention that S =
> "${WORKDIR}/git" should now be removed?
>
> Could you send a follow-up patch?

I just sent that; the content should be accurate, but the formatting
probably isn't perfect.

Alex

