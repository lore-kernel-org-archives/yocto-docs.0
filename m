Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
 by mx.groups.io with SMTP id smtpd.web08.2217.1605261012735632601
 for <docs@lists.yoctoproject.org>;
 Fri, 13 Nov 2020 01:50:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=BoOzh3hU;
 spf=pass (domain: linaro.org, ip: 209.85.219.173, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f173.google.com with SMTP id l14so4038242ybq.3
        for <docs@lists.yoctoproject.org>; Fri, 13 Nov 2020 01:50:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=paLZLB2YvMwjw3ATYmC6jqWzMts/uF7Tq1uiaOS5FP4=;
        b=BoOzh3hU0awmrwTZzTbdJO5ajxa+DqLR5IHddCPW0vPI/nvOVTy2NhfZAX+wWpe4f9
         vuhWO0M5zYIyV5M8wXjMED2Py91ewUB8uQ3Oop918hFHWTMUkK0mvXZD2ZvcI3JF4/mo
         9H1QFdT9TifPrB99O0SF83MDlkc8R+xxR8z5fr1hj7NFgbmEfAfjbozNEPzPyR6cr06U
         dfLcxLlky573dTx1OkktWWmVw/WB/72h0hqS319wyaMHSLANbf/UXjV22C/iR+SSe9vh
         TaO5eTKfnHdPZeLEteBGxHNGs6vvGtbXYN93opWeVmyeZLiQBgDp67PJ0PyO6PBPbeXe
         YA7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=paLZLB2YvMwjw3ATYmC6jqWzMts/uF7Tq1uiaOS5FP4=;
        b=PEYxN+LvsWxfD5B021hR58OWkIs/3cf8N/m2tqBLmgwChHSb9c/iMEKOeBrdZ63+FI
         Tk9ORASHkLkU42NQIj7vb7g07uWBGS5oA49uoSpog5yq9E9XyIlZ1FZQuvFYc+k4V+o8
         hIaTEsiyh1rY/6muxPkhl+bIG7pJOxeS+mfVXpGrko/+O+D/6JwMj6XQs+iVJCXEbqcd
         HC1gU78IGzTEndNzrKKuLytMr4X2OCcD9g8DUvJF/4u5TOWGOsWUSqSDMyq/mANQ1S/f
         KPr1PUIWE7GGGcWsGVKBAkEhd65orvrTy6WCYKhL5qNYSD1YB1GdLgMAcxKc0fvCHq5x
         crDw==
X-Gm-Message-State: AOAM5326umAQttYIoH0LQE+0cQAu9RRFCghna+s/a+MXDhid99UJIQVg
	CxFvS+BTaCnfCuUQRd7S1PwomuhnTWK9dN27QFDN+Q==
X-Google-Smtp-Source: ABdhPJw7MhC82it8t4KYC9vwF4tFuwKmR7JHOuTNgEbAEd3Od47C0KonAoENVDmgbqjmxbxfuJ2W1NTQDMI79nG8jik=
X-Received: by 2002:a25:6e8b:: with SMTP id j133mr1677938ybc.273.1605261011637;
 Fri, 13 Nov 2020 01:50:11 -0800 (PST)
MIME-Version: 1.0
References: <CAP71Wjy7eBbs3X4PWtXFeFGM3G1cxC7AejE4g+vtDW=jZwF7HA@mail.gmail.com>
 <29331cdb3acac797206206435262c8dd34000c14.camel@linuxfoundation.org>
In-Reply-To: <29331cdb3acac797206206435262c8dd34000c14.camel@linuxfoundation.org>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Fri, 13 Nov 2020 10:50:00 +0100
Message-ID: <CAP71Wjw=d6BhDKqNuvFxwoYZgRxCrmw58nWeiOQeESdFqBJj-A@mail.gmail.com>
Subject: Re: [docs] pdf output for Sphinx
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 13, 2020 at 10:35 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2020-11-13 at 09:31 +0100, Nicolas Dechesne wrote:
> > I just tried for the first time building a PDF from the Sphinx docs..
> > it's not bad at all.. Of course it's *different* from what we used to
> > have. In the previous docs system, each 'manual' was its own
> > standalone 'book' or project, so we had one 'web page' and one 'pdf'
> > for each manual or book.
> >
> > The approach we decided to follow with Sphinx, is that we have one
> > docs project that includes all our document files (books/manual,...).
> >
> > Then, obviously, when we generate a PDF output from Sphinx, we get a
> > single PDF file with the project's entire documentation, instead of
> > many PDF files.
> >
> > Just running make latexpdf into the docs folder generated this PDF
> > file:
> >
> > https://people.linaro.org/~nicolas.dechesne/theyoctoproject.pdf
> >
> > It's a 7MB file, with ~800 pages.. My very first impression is that
> > it looks really good, and to be honest, having all docs in a single
> > file might even be better, from a user perspective.. If you open with
> > a PDF viewer, you should see the 'outline' that looks like our 'left
> > menu' on the website, you can search any term...
> >
> > I have done no customization at all, I am sure we can customize the
> > header/footer and improve a few things..
> >
> > I had a very large number of warnings during the build, which I have
> > ignored for now ;)
> >
> > I also ran "make latexpdf" in the bitbake docs..:
> > https://people.linaro.org/~nicolas.dechesne/bitbake.pdf
> >
> > Feedback?
>
> I think it looks good, I like it. We should start generating and
> publishing them.

We need to play with the pdf theme/option first (a logo on the first page, ...)

>
> I was thinking we may want to publish pdfs of the individual manuals
> too. I suspect that may be possible with a little creative juggling of
> the files but I know how much you love my crazy scripting around things
> like this! ;-)
>
> I'm torn on whether need to or not. 7MB for 800 pages is good going.

I think it expects one entry page (e.g. index.rst) per PDF doc. so we
could tweak that a bit indeed. We would need to override index.rst to
generate each 'book'. But cross reference between 'book' would become
HTTP links (to docs.yp.org). With a single book, you can follow cross
references within the 'big manual'. If you search for Bitbake terms in
the current PDF, you will see they are links to bitbake html docs.
That kind of goes against the idea of having the PDF as a local copy.
In fact I would argue whether we should include the bitbake manual in
the same PDF :)

>
> Cheers,
>
> Richard
>
>
>
