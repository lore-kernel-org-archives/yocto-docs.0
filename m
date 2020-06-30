Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
 by mx.groups.io with SMTP id smtpd.web12.3944.1593541836674659896
 for <docs@lists.yoctoproject.org>;
 Tue, 30 Jun 2020 11:30:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=liuoebHj;
 spf=pass (domain: linaro.org, ip: 209.85.219.182, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f182.google.com with SMTP id x8so4567615ybl.9
        for <docs@lists.yoctoproject.org>; Tue, 30 Jun 2020 11:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=JHOzWkDxNrJDn+MZwVmkpTkbGmR8UbpoLjohzABAgAM=;
        b=liuoebHjFNwcHyaWdjfakKGebpqfJosX0YpL6lnotauMZ/Ep+CrlMChCsFfEn7+95t
         UuWkYfr1M6t8ZNJXdc84ZwSEHgSEqwyKAv+l30vVajW0LPIRNaKfRcQyqvDoioYpVTLA
         f4hCH9P5GEwULb3Ma/T3Z2E67sI9QrL53rUpcbDVhNWyX1wCgVacR6jTQn+F+thZCt8r
         R1bAOxtGYq4AKc4j7pzZDeGm5WdtH/H7YW8zERJu9JNOnAo711oPGfekcuy3VGZRBpa2
         2R6Rpvv6WZiDr3pZdfltZKot9H4l5nkdFIGgSxYuqMpJDJwFHP2SE89IbZTiaZ6Z5iKR
         2PqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=JHOzWkDxNrJDn+MZwVmkpTkbGmR8UbpoLjohzABAgAM=;
        b=RgjJ7HVKI/uHnM1aYcU73ujU3/D5mFqIIjNutWNie0a8hhAO6J/++ZchL4LRLf86pJ
         BAkYlO1PdkMdcBLhi6M/rvP7TF/Nha+rbnozkGkc2jC7pNf5yamNS4/S3+sjmFg7ldwX
         pYVpnAr7tOaDOvUT7LZvkXhOXI2lioyoIVb/6OdZdDN77mquN48hyWx9HUtNDYcBOGiZ
         k6OWdUob7hKOz3Cr0CjGenWXcQD5k/vdhkmZt4dHuRxo14Yp7Ebi6tJtFVzfmAYXwfvi
         kXMcAytlLsvHztlxYT/uJPKvuHqHwCj8HhMxmFxctT14Gx4wYVAqT/VD60HthuuAaFqb
         55pQ==
X-Gm-Message-State: AOAM530J9BwBz2CAGvNbzqVKNThDycXy8CKHzvLbvShpihn7UfZEQsA6
	dtnWYQ77kmsurLlf/i8dL3ZEUDm0xEWHHi0mGKBufdk2w+c6WQ==
X-Google-Smtp-Source: ABdhPJxSOLgpbBsEjK5u5Jpv9Z/V7LWQ4aKQQbIqHOKR/LXyrNc7d1amaBgNbL26TeruGr7lokNpNI/7cD7ul8qHfN0=
X-Received: by 2002:a25:8392:: with SMTP id t18mr22566829ybk.397.1593541835380;
 Tue, 30 Jun 2020 11:30:35 -0700 (PDT)
MIME-Version: 1.0
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Tue, 30 Jun 2020 20:30:24 +0200
Message-ID: <CAP71WjzDDvJja-VXirgzcLh9Pf+f24otxvwmpKYwopE1oNzSNQ@mail.gmail.com>
Subject: [sphinx] some updates
To: docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

hi there,

As discussed previously, we have started to work on the migration to
Sphinx for yocto-docs. We will be using a branch called 'sphinx' in
the yocto-docs repo.

This branch will be rebased/squashed, it's a dev branch, see [1].

I have rebased the previous branch against master. Compared to my last
email (with the previous branch) the following changes have been made:

1. I regenerated all the .rst files using different headings options
to fix up some issues I noticed. A detailed explanation is available
in the commit message at [1]
2. Added the SPDX license headers, which have been added in the
docbook files recently
3. converted the test-manual
4. added YP logo

We will be publishing the Sphinx based documentation on a web server shortly.

Pandoc tries to stick to 72-char line by default. Please check if you
are happy with that, or if we can or should increase a bit. 72-char
seems a little bit aggressive these days..

Mark: can you please start looking at the CSS configuration? We need
to decide if 1) we create our own theme, or 2) customize an existing
theme..

I would be happy to review patches against the sphinx branch, here on
that list. Please send them with [sphinx] in the subject line.

cheers
nico

[1] https://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/log/?h=sphinx
[2] https://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/commit/?h=sphinx&id=24bd7064e6b065eb15438d3acb244b8d4152fc16
