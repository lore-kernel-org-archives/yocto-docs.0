Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web12.19737.1617384228093620576
 for <docs@lists.yoctoproject.org>;
 Fri, 02 Apr 2021 10:23:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jTfKZlvO;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id t5so2782987qvs.5
        for <docs@lists.yoctoproject.org>; Fri, 02 Apr 2021 10:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5eQsQHmCLpXHNYWO4xmN4NKTjprON+DZdptmeW/RYT8=;
        b=jTfKZlvOS8qiIB51yCzfmFLleDENfAnEqkp4QymO72xVFmThElgmULjCQVDiIrkw1C
         I7AKerTNj4z0gRY852CpJ1BmAvbbtEWpaS2oWdD4pb1GB2J+mRpFdxCzcLJ4PJzMumAG
         UfrsSI7ncE/bA4oRp8SCAd2WGT83yJEEr6p37kYqXs5rzVT12KKJg1fpAXjDfkK1aUIz
         il7/ZKYVZImerXB6NE7BiS1fmg9SofuI+nkxVrlst4bBZ37CdwggQjKJH/wiEhmlX/ii
         5d9gHlTxbmnFRM+t02QgS+GXgV4JQPM63rDLVPBehe86TBSOd1D4r8Upq7Vchgs98Etm
         rJyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5eQsQHmCLpXHNYWO4xmN4NKTjprON+DZdptmeW/RYT8=;
        b=M+SdUW5IIWrJIdS/RUT00HPaSQBQijWc03P7i4P601Dk4agFnKdtWOkSN5O6/2Pj3m
         1j+E73uDs86JqAPqbDSyppgTs4UqyVihni23PgtQYnb6Ckk1QzkacgkmtScrhzQXBe4M
         uE9bRI6jPT7gP/hj7V1JNIC4oq+kOzfQ1mwJgv9dWUUoyYGczda5G8ZLZK+TL4kqi3oj
         ZhnEc4NrCOpc7cqlNuM2zd0w40b5oWYIuUqH0JEYGp+sjCbaUIQPw/T3KxlbAyQURyfp
         6+BhpCEe5lziQx9Dae+fzwFzfAdl+mwL6mIq2J4FkXZOpLmyEBtJA3Kurx7iGdPRMPET
         0l5Q==
X-Gm-Message-State: AOAM5336SQ6s28G4H+Hf52bSCfcWdEMYKVlBUpnRFu5tJ2J157xUidLU
	W1sFmJLIovn77u0TkOv24B6LaUdk7mq97/ifzvc=
X-Google-Smtp-Source: ABdhPJyC5d18+Q6xkFN6cCTUgdH2TRC2PcbS5UvacfwKS3e+ScElBtX5XwJHE19CHTdt1SHxj1E5SIXepSSLCMpTGqk=
X-Received: by 2002:a05:6214:f27:: with SMTP id iw7mr14107706qvb.50.1617384227223;
 Fri, 02 Apr 2021 10:23:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210330151905.13402-1-michael.opdenacker@bootlin.com>
 <20210330151905.13402-2-michael.opdenacker@bootlin.com> <7d197ec8-75b8-5010-bca8-f9174961609f@gmail.com>
 <81ead373-461c-b6b9-56cf-ed9fd952f553@bootlin.com> <CAMKF1sqNnGQwLVJuZzZqi8TaUm7+XUZsiM=6CgoRhhupnsv9uQ@mail.gmail.com>
 <16720B54D46DA7C3.28438@lists.yoctoproject.org> <2805bebd-42dc-288c-9967-6faf115eddcd@bootlin.com>
In-Reply-To: <2805bebd-42dc-288c-9967-6faf115eddcd@bootlin.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 2 Apr 2021 10:23:21 -0700
Message-ID: <CAMKF1spLLUmEAuJC7Mmg4tMtw5zkTkk2W1q=pCw6=ZUm7wMYNg@mail.gmail.com>
Subject: Re: [docs] [PATCH 1/1] YP overview manual: style improvements
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

Hi Michael

Yes send me a link to epub I would like to put it on my kobo

On Fri, Apr 2, 2021 at 7:10 AM Michael Opdenacker
<michael.opdenacker@bootlin.com> wrote:
>
>
> On 4/2/21 2:47 PM, Michael Opdenacker wrote:
> > Hi Khem,
> >
> > On 3/31/21 5:39 PM, Khem Raj wrote:
> >> the left and right margins,  how do they look on epub readers for this
> >> document was
> >> what I was wondering.
> >
> > Understood. Actually, the output is almost perfect and there are no side
> > margins. That's great to read the text.
> > It's just some of the diagrams that would be easier to read if they were
> > rendered in full width.
> >
> > I'll see if there's something I can do and will keep you posted.
>
> By the way, don't hesitate to try by yourself (testers are welcome!)
>
> sudo apt install fbreader (or any ebook reader, if you're using Debian /
> Ubuntu)
>
> cd yocto-docs/documentation
> make epub
> fbreader _build/epub/TheYoctoProject.epub
>
> Cheers,
>
> Michael.
>
> --
> Michael Opdenacker, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
