Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web09.1974.1582231361498405959
 for <docs@lists.yoctoproject.org>;
 Thu, 20 Feb 2020 12:42:42 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=fkLlxsmo;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=794; q=dns/txt; s=axis-central1;
  t=1582231361; x=1613767361;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=JTJChnGmhliKA6Cw3u4JHK6zn5MVHQ4jcMkXB+rBB6o=;
  b=fkLlxsmo7AtigqimLR+yMUj9uUYDSLYX1Yt/mz4HXk0Dln6LhtytzuVD
   INPjHttLqU0nQq5FLxauLPAMG0DLBgjVof3s+pUrc9pSjQU7Y/cSMdqzY
   +4HDWYV1mo6CuCxPajzl7Os2i42/BGnvhi8qBgerB2rSUNajdQw1vDbyn
   x2h1+rgzYRkedDAQCvAJ/+rmzznY5vF8SQbeo41h1wFOuyZKif/A793JF
   W9uij+8G1dM104TKMRLswc4vRgO4DjFlym00Sqpazi8lY5RufN5DCGBH2
   lR+rlT0jsc6oydG9vQ5TX4XdIvS7eqlylx82ZDsCrooXAqRwff91ND6fZ
   Q==;
IronPort-SDR: y2R01Bm/2wZ9vI4qa6Q+TArVjzEFN/9lK/nVNO4Q3pxwhjEd8Oj/IxSo96yDdURbOIgRREf6G1
 GrLPbl6Fj9OfzdvThjk8+8j0TUxucO6x57ND79nJkN+XLBNy5u3KWAGqv1gcDk6OkFQlRMleW9
 IWGCdgd0Prpmy6xE3BECoD/MT+2c3cOEW5ymGNwVeQyJxewX70/2s4p/X4eZFf0/IojtzaR8Jb
 X73BxY5gcYtVBYmUQ9ZWvFM7j52GpPOt/qT19cNUGtwOeHCVSTjQdg13QaI0q9DWebzYELQRHz
 1IU=
X-IronPort-AV: E=Sophos;i="5.70,465,1574118000"; 
   d="scan'208";a="5501630"
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: "docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>, "Michael
 Halstead" <mhalstead@linuxfoundation.org>
Subject: Re: [docs] [Resend][PATCH 1/5] ref-manual: The sanity_info file has moved from build/conf to build/cache
Thread-Topic: [docs] [Resend][PATCH 1/5] ref-manual: The sanity_info file has
 moved from build/conf to build/cache
Thread-Index: AQHV6Cw1PU+E0Wq/xEqYGDg+ewu5magkiWGA
Date: Thu, 20 Feb 2020 20:42:39 +0000
Message-ID: <07b7e95db4ba4fa78b43bd7d143bdd94@XBOX03.axis.com>
References: <15F53638120140E5.26907@lists.yoctoproject.org>
In-Reply-To: <15F53638120140E5.26907@lists.yoctoproject.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: docs@lists.yoctoproject.org <docs@lists.yoctoproject.org>=20
> On Behalf Of Peter Kjellerstedt=20
> via Lists.Yoctoproject.Org <peter.kjellerstedt=3Daxis.com@lists.yoctoproj=
ect.org>
  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^
Why did that happen? When I sent the same patches 10 days ago to=20
the same destination, my address came out normal without the via=20
(I resent the patches because they had not appeared in Patchwork).

The reason I ask is because I expect this gives me a separate=20
entry in Patchwork for this address compared to my normal entry,=20
which complicates things when I want to search for my open patches.
So if possible I would like to avoid this in the future...

//Peter

