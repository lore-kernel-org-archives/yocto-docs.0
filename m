Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web09.2157.1605261281667682842
 for <docs@lists.yoctoproject.org>;
 Fri, 13 Nov 2020 01:54:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=THMxLG5j;
 spf=pass (domain: konsulko.com, ip: 209.85.221.46, mailfrom: pbarker@konsulko.com)
Received: by mail-wr1-f46.google.com with SMTP id r17so9115399wrw.1
        for <docs@lists.yoctoproject.org>; Fri, 13 Nov 2020 01:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nHqOwNQXItBcGRFl6WGqSx2MvZkpKTLaz1lvnYu6lwk=;
        b=THMxLG5j5q5KY1BzO4J7UHmSzFXuwzzxP3wfLyhy5Ka2VpsDaMY8wVsoK+y/cjzZlI
         iXWtzsWLfpqsfYcwDL5jkKL5MELrmebzfzLM2zbSVi3SGxcmq0wibOVGqcPtKjfQR2Nc
         yguesGyp+ZU82EHb0Y71g0r7k/MS3Qdfs+sqk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nHqOwNQXItBcGRFl6WGqSx2MvZkpKTLaz1lvnYu6lwk=;
        b=sGS4zAowteuzkAy/up3SGMdl+0TBoSywTfqPyKqKCHAsWmmPZrXnw1ihfEzKsXswp/
         6GS8XqxuSY7+XkWL/Z9pLdFJFMfuhN09LFc9CLCMyGIit75BiRO3g3z8uALk1AK90IZG
         /X4ubjm5CeL1ih6XlwOlNnhJ/IvueOKLQ1tpPYb/tJM5Dp6UgRoR5y54rdGZlF5JxR07
         cowLMdvFTqjJX9typJAuWvwLbLJzIrf7EGYtUyR3fT1Ya4VaRynfQnKcEVz82S2bZq+p
         HyLzn5hllRC4IFk5Z/5PDHAOq4VKG2+pXK6xMY5tObeyNHttlpa90t0JMVu6jUC2YG1C
         l+Lw==
X-Gm-Message-State: AOAM530Tx1gK5lP9DpoF1S/x9X5CShtCca5sI9CZFDivjOzuVseov0Lb
	VYA7HSpUUe6R/7j5txNi1Uz4uXDTpREdxw==
X-Google-Smtp-Source: ABdhPJz1o/uS6pCIcA6Xgg7XL/4dHE42TS8W0jL2sXzTY9jBIw8VtVmGBhzvg6VdfYuMk1r87CzvMw==
X-Received: by 2002:adf:f181:: with SMTP id h1mr2274722wro.267.1605261279933;
        Fri, 13 Nov 2020 01:54:39 -0800 (PST)
Return-Path: <pbarker@konsulko.com>
Received: from deb10.home.b5net.uk (cpc76132-clif11-2-0-cust249.12-4.cable.virginm.net. [80.7.160.250])
        by smtp.gmail.com with ESMTPSA id f20sm8886036wmc.26.2020.11.13.01.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2020 01:54:39 -0800 (PST)
From: "Paul Barker" <pbarker@konsulko.com>
To: docs@lists.yoctoproject.org,
	Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: Paul Barker <pbarker@konsulko.com>
Subject: [PATCH] conf.py: Improve TOC and Outline depth in PDF output
Date: Fri, 13 Nov 2020 09:54:31 +0000
Message-Id: <20201113095431.7425-1-pbarker@konsulko.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The default PDF output shows only chapter headings in the table of
contents and in the outline (aka PDF bookmarks). We should override
these defaults to set something more suitable.

With a depth of 2 for the TOC we see both section and subsection
headings which is enough to get the list of classes in the reference
manual and the list of topics under "Common Tasks" in the development
manual. Going to a deeper level would make the TOC unwieldy but we do
want to make sure we can navigate more precisely using the outline
(commonly shown in a left tab in PDF viewers) so we set the depth to 5
for the outline.

Signed-off-by: Paul Barker <pbarker@konsulko.com>
---
 documentation/conf.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/documentation/conf.py b/documentation/conf.py
index 9a0186f35..a8df6e8f8 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -124,3 +124,8 @@ html_last_updated_fmt = '%b %d, %Y'
 
 # Remove the trailing 'dot' in section numbers
 html_secnumber_suffix = " "
+
+latex_elements = {
+    'passoptionstopackages': '\PassOptionsToPackage{bookmarksdepth=5}{hyperref}',
+    'preamble': '\setcounter{tocdepth}{2}',
+}
-- 
2.20.1

