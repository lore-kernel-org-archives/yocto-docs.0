Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
 by mx.groups.io with SMTP id smtpd.web09.7645.1608126646860856528
 for <docs@lists.yoctoproject.org>;
 Wed, 16 Dec 2020 05:50:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=l5zrWcoP;
 spf=softfail (domain: sakoman.com, ip: 209.85.217.50, mailfrom: steve@sakoman.com)
Received: by mail-vs1-f50.google.com with SMTP id s2so6292991vsk.2
        for <docs@lists.yoctoproject.org>; Wed, 16 Dec 2020 05:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zA4ecAQZJkZCLgEUWqZ3JLxhdz5SPl98D0AN0FyA3Xs=;
        b=l5zrWcoPA81ZuPLfZBSV5lHuIVIEJb3KVTQUIF6I4/BOj6twgz1aIr8VHkbAFF7SNG
         Hvedn5J9kDx9AWnt4d2Otofw9bOYun+0YPB2vqpGnnSy30THL8WYBJxZ2Fay8xkWIN5J
         d1en1IxsfKbi5tsJncZW/G8+PPF1RhvgLE16b2aVUcSr8tTm4WQ9nXXKgxqd4QAcivbs
         ydGZd7cP+oYZyS408GWNANBRpj7niefcZoqwZZF0vAEBNHIenWgkxpId940Ot/jtlOks
         8LusTi6hc7M72giKfxEczwKGjrt7fDOR8GaXqJgC0wsCFJOLWTAlooPkdiWz98MySU+w
         ByPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zA4ecAQZJkZCLgEUWqZ3JLxhdz5SPl98D0AN0FyA3Xs=;
        b=XHDP6H7DM1hWlvREnb6tnhQNz93qSYij039smcxgftRyaG7MnJObsASUQh0ylutrAM
         m3GEEzmhAU0F5O9ap7/v1mThJQttVGrKSt1tROfjrEYRo8LLLCDw6vzRqwFQpJV6V9uH
         kGKYkPtERAk1mCX6Ffm31ktr/VqsPfhjgnOXSyjRm6eBIR66WoGxczh/oeloHxxM84yq
         EcPJtmnECHAVxlV7OwJg4W33HtBR37SZO3KSIOqbfa4kjpfSGZroaJwHll6KvsWqDY/a
         6pZeJMZuw/MN0ov7pUQTcgDlxF+Q8OdnoK3WSygXaalrEL8q/hG/b3iF4BwWZQmz6sNz
         EWFA==
X-Gm-Message-State: AOAM531UBxrtFnVLEejI7Gs+bZDFZEJjFOkJMrG1M2Qx5vWaNEUWHg5E
	7cxNYAB0rTCI+8EOun3d/t/2Kk0EDPrKNBjfwgb0Hg==
X-Google-Smtp-Source: ABdhPJwrDLTW9sntpQlR+EMPZgpvp+AEAJa5/yE0kp71UCTchoee7XYo/ZLqLYRDNF54fYdAgMtmd16/vss1tw8G7B0=
X-Received: by 2002:a05:6102:4b6:: with SMTP id r22mr9658518vsa.41.1608126645946;
 Wed, 16 Dec 2020 05:50:45 -0800 (PST)
MIME-Version: 1.0
References: <CAP71WjwM3+3SwN9XRO4Cthur7iwQB0O2bKBSh3VQXkGZbYUYWA@mail.gmail.com>
 <3f2097a08c323b05c32013bc0d7f84c1142f0838.camel@linuxfoundation.org>
 <CAOSpxdaLCD+5HLLuwpoCCvX_xBSZasNYg4JsOKx7Ys3xqAuySw@mail.gmail.com> <CAP71Wjzkq+BZPCOqx7CWvNKy8kg25j4BwWc6Nc0iW_nKTstmww@mail.gmail.com>
In-Reply-To: <CAP71Wjzkq+BZPCOqx7CWvNKy8kg25j4BwWc6Nc0iW_nKTstmww@mail.gmail.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Wed, 16 Dec 2020 03:50:34 -1000
Message-ID: <CAOSpxda9G-c4Tiu3G5NkPm-xAsYUnq=2EgAJ0UT4aaZCvkP5bg@mail.gmail.com>
Subject: Re: Sphinx 'backport' for Dunfell LTS
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

Hi Nicolas,

>> Let's do the merge right after the 3.1.4 release.  I'll be sending the final pull request for that later today.
>
>
> Where do we stand with this? Are you still planning to merge the Sphinx patches in dunfell branch (before 3.1.5)?

Thanks for the reminder!

I'll pull your changes into stable/dunfell-next and send a pull request.

Steve
