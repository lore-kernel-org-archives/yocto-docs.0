Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
 by mx.groups.io with SMTP id smtpd.web10.1545.1605256325608108223
 for <docs@lists.yoctoproject.org>;
 Fri, 13 Nov 2020 00:32:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=jOMMm59O;
 spf=pass (domain: linaro.org, ip: 209.85.219.179, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f179.google.com with SMTP id 2so7947295ybc.12
        for <docs@lists.yoctoproject.org>; Fri, 13 Nov 2020 00:32:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=u9z6XW66TH3DtHG4q4lJzLm7iV4JEbQCaqTcFykR1ZM=;
        b=jOMMm59OCULFnT/IOXFNsuqOPH1np9xZuKok8HWBHFDJFZCe0j7jwKXOJfrxfPG6gq
         6wTCwf4JiWka1E8jUSNUL1BpwkKqsTIvQb4UPKQOSl3Le50lFix156hwqTPM8XXTzDyu
         CPJqyaG1vGAkSrnyUZfOu8XHCjUEs8Z6StnQM20Rr3v7FNDfmQsroercioZAnW2sNspp
         ahiSgC6HZkU2l6RDOQcxv6KRJGt3fybnO573hHYaFTpqOZrwZFUEMUIi0/bZnn3wcGTF
         J3vZysQZZCaGeU1cGL/P+caRf4iTsh5IXfv/AtXu3bN3BmubjEGOifHfzYRwwtu27hKx
         n7Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=u9z6XW66TH3DtHG4q4lJzLm7iV4JEbQCaqTcFykR1ZM=;
        b=Q+yFfuS+SsqAuDROI3k7NpmOfenBIcTdcFvCnwxgqw+IOMG+dQYKeUE542aGbDtL4N
         NmUCHOoDhBiXvlaQE6Rk5qznqsnvdMepFwD4iSxvcThTpvIOGTJoAucRXFSXawAWx9lD
         iP7ac7n+qm4cO7KqtmtOsUS02gkRMqGX8K/0yxwK5MN8DMBxSLIoGGG5u4zAxcoa5cB9
         eE4Nc4d247qFBEJK1B8a+1UbsHX1P3sFXhb3WPoJHFoC0W7Zv6Yjidr6erkhpWUJKktV
         VJLnzDlBFln6pnQYc0aYxep5oJpoGeHpmQAO267fFxgjmc/6UbS+9LD0wrCG3td0/VRr
         ac3Q==
X-Gm-Message-State: AOAM532PdCzUA4SFsoUqadfmtklhjnIDI7OrCh5mULGwld+D1fw8V1Gq
	y/pidJnEzUHbotLZoR9EzvL7g+iu1VcO1MiNsH3a2R2vNIwlrVyn
X-Google-Smtp-Source: ABdhPJwn35BMfin/NC+SRe8w0oOka0CkcloHvUgGo5xxVFyJ3PR6SXlOX8m6F9dKs1MCN06XHhFPn4jf92czy2co2V4=
X-Received: by 2002:a25:9b04:: with SMTP id y4mr1337914ybn.397.1605256324379;
 Fri, 13 Nov 2020 00:32:04 -0800 (PST)
MIME-Version: 1.0
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Fri, 13 Nov 2020 09:31:53 +0100
Message-ID: <CAP71Wjy7eBbs3X4PWtXFeFGM3G1cxC7AejE4g+vtDW=jZwF7HA@mail.gmail.com>
Subject: pdf output for Sphinx
To: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

hi there,

I just tried for the first time building a PDF from the Sphinx docs..
it's not bad at all.. Of course it's *different* from what we used to
have. In the previous docs system, each 'manual' was its own
standalone 'book' or project, so we had one 'web page' and one 'pdf'
for each manual or book.

The approach we decided to follow with Sphinx, is that we have one
docs project that includes all our document files (books/manual,...).

Then, obviously, when we generate a PDF output from Sphinx, we get a
single PDF file with the project's entire documentation, instead of
many PDF files.

Just running make latexpdf into the docs folder generated this PDF file:

https://people.linaro.org/~nicolas.dechesne/theyoctoproject.pdf

It's a 7MB file, with ~800 pages.. My very first impression is that it
looks really good, and to be honest, having all docs in a single file
might even be better, from a user perspective.. If you open with a PDF
viewer, you should see the 'outline' that looks like our 'left menu'
on the website, you can search any term...

I have done no customization at all, I am sure we can customize the
header/footer and improve a few things..

I had a very large number of warnings during the build, which I have
ignored for now ;)

I also ran "make latexpdf" in the bitbake docs..:
https://people.linaro.org/~nicolas.dechesne/bitbake.pdf

Feedback?

nico
