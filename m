Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.web10.2067.1605260761129839943
 for <docs@lists.yoctoproject.org>;
 Fri, 13 Nov 2020 01:46:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=gRxNKLTe;
 spf=pass (domain: konsulko.com, ip: 209.85.210.42, mailfrom: paul.barker@konsulko.com)
Received: by mail-ot1-f42.google.com with SMTP id a15so8436887otf.5
        for <docs@lists.yoctoproject.org>; Fri, 13 Nov 2020 01:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WOgbUhw63SqwM1YtTOTNNcooiICXC9NT/OpSrJkHNT4=;
        b=gRxNKLTesmAL11pALTAUUZufPewFANvUNx1ZHjPkwACoyt0bhpDmMjOTeaKKo2L9na
         YlMaZvPY4Pj1p1yka+EyIrQNILkqkzow3HBrrpuC3htmAhMsV2YBY0zQP30yuu41fKYp
         xmqg4IvTrlK07J+Qkgz02k4UgM8iUm6iP7ESY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WOgbUhw63SqwM1YtTOTNNcooiICXC9NT/OpSrJkHNT4=;
        b=ILvTzXlcKOCvv8te+h3cakrqQggw/2BoEMLlAW3IkS0DQXYBstZHJhHrB+x4GrpdAd
         4IUBeVM+6s6pxpaiIqRtAUzCF6jx7Nt/mGWqD4HfpR6JTBcO8nVfh8PxEMLuzDzIPUnV
         pD/dvo0BMjhddIIhDvO2MPn2u/hnz1EVN24KnFtJ+dq7vnK+G7oWUlmOVz2LUsG8p/w5
         ub0os2UPMPJWsI7S6XjQEHdv+zTwzjtGvSte6AMO773bLRTYN8CICj7j97WJjAylusLC
         NEHEk1YwqXEYRnniym1O6ScVaAf78BUZTtnb5NDT3wdk2t2gTRLxpEdtBh2cqN4hvMc7
         5LSA==
X-Gm-Message-State: AOAM5305yPN61+i9PeCEWDh5R55NezCVnwTi7oNbZdC6iayAjkCNn3+1
	PquFukpiJDYR6AilK3zRHEIpJsURcMTlTgzPyIBhZg==
X-Google-Smtp-Source: ABdhPJxLG5ZAowwzGs3npELMm848nqt6WlinQI9+ZL8u3/6Zc6GO7tzu/CP39zRwMEAQ8L7GQbXdoLvQtOi68Ir7IlA=
X-Received: by 2002:a05:6830:1b66:: with SMTP id d6mr960369ote.258.1605260760434;
 Fri, 13 Nov 2020 01:46:00 -0800 (PST)
MIME-Version: 1.0
References: <CAP71Wjy7eBbs3X4PWtXFeFGM3G1cxC7AejE4g+vtDW=jZwF7HA@mail.gmail.com>
In-Reply-To: <CAP71Wjy7eBbs3X4PWtXFeFGM3G1cxC7AejE4g+vtDW=jZwF7HA@mail.gmail.com>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Fri, 13 Nov 2020 09:45:51 +0000
Message-ID: <CAM9ZRVu+ko3WhKNSvkanqXWbdWfVLn_g4X9Nk65NAW5MRGzVZw@mail.gmail.com>
Subject: Re: [docs] pdf output for Sphinx
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 13 Nov 2020 at 08:32, Nicolas Dechesne
<nicolas.dechesne@linaro.org> wrote:
>
> hi there,
>
> I just tried for the first time building a PDF from the Sphinx docs..
> it's not bad at all.. Of course it's *different* from what we used to
> have. In the previous docs system, each 'manual' was its own
> standalone 'book' or project, so we had one 'web page' and one 'pdf'
> for each manual or book.
>
> The approach we decided to follow with Sphinx, is that we have one
> docs project that includes all our document files (books/manual,...).
>
> Then, obviously, when we generate a PDF output from Sphinx, we get a
> single PDF file with the project's entire documentation, instead of
> many PDF files.
>
> Just running make latexpdf into the docs folder generated this PDF file:
>
> https://people.linaro.org/~nicolas.dechesne/theyoctoproject.pdf
>
> It's a 7MB file, with ~800 pages.. My very first impression is that it
> looks really good, and to be honest, having all docs in a single file
> might even be better, from a user perspective.. If you open with a PDF
> viewer, you should see the 'outline' that looks like our 'left menu'
> on the website, you can search any term...

Looks good, patch incoming to fix the TOC and outline depths....

-- 
Paul Barker
Konsulko Group
