Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web12.3960.1600300773735900841
 for <docs@lists.yoctoproject.org>;
 Wed, 16 Sep 2020 16:59:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.195, mailfrom: foss@0leil.net)
X-Originating-IP: 80.110.110.137
Received: from fiqs.lan (80-110-110-137.cgn.dynamic.surfer.at [80.110.110.137])
	(Authenticated sender: foss@0leil.net)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPA id 08C0C60004;
	Wed, 16 Sep 2020 23:59:31 +0000 (UTC)
From: "Quentin Schulz" <foss@0leil.net>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <foss@0leil.net>
Subject: [PATCH 07/16] sphinx: what-i-wish-id-known: update "don't be fooled by doc search results"
Date: Thu, 17 Sep 2020 01:58:57 +0200
Message-Id: <20200916235906.243174-7-foss@0leil.net>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200916235906.243174-1-foss@0leil.net>
References: <20200916235906.243174-1-foss@0leil.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The release selection for the documentation is fortunately not so complex anymore.

Let's also add a link to the mega-manual instead of just naming it and mention the
search bar as well.

Signed-off-by: Quentin Schulz <foss@0leil.net>
---
 documentation/what-i-wish-id-known.rst | 26 +++++++++++---------------
 1 file changed, 11 insertions(+), 15 deletions(-)

diff --git a/documentation/what-i-wish-id-known.rst b/documentation/what-i-wish-id-known.rst
index 7cf6dfd9a..c0de1ec72 100644
--- a/documentation/what-i-wish-id-known.rst
+++ b/documentation/what-i-wish-id-known.rst
@@ -68,21 +68,17 @@ contact us with other suggestions.
    use Google to search for Yocto Project concepts or terms, Google consistently
    searches and retrieves older versions of Yocto Project manuals. For example,
    searching for a particular topic using Google could result in a "hit" on a
-   Yocto Project manual that is several releases old.  To be sure that you are
-   using the most current Yocto Project documentation, use the
-   :yocto_docs:`Yocto Project documentation </>` page to locate the right
-   documentation for your software release version. If you use the search bar on
-   the top of the Documentation Overview page, while that search isn’t optimal,
-   it will point you to the documents where your search string can be
-   found. That search will usually identify where most of the attention on a
-   given term or concept is.
-
-   Many developers look through the complete Yocto Project set of manuals for a
-   concept or term by doing a search through the "Yocto Project Complete
-   Documentation Set".  This manual is a concatenation of the core set of Yocto
-   Project manual.  Thus, a simple string search using Ctrl-F in this manual
-   produces all the "hits" for a desired term or concept.  Once you find the area
-   in which you are interested, you can display the actual manual, if desired.
+   Yocto Project manual that is several releases old. To be sure that you are
+   using the most current Yocto Project documentation, use the drop-down menu at
+   the top of any of its page.
+
+   Many developers look through the `All-in-one 'Mega' Manual <https://docs.yoctoproject.org/singleindex.html>`__
+   for a concept or term by doing a search through the whole page.  This manual
+   is a concatenation of the core set of Yocto Project manual.  Thus, a simple
+   string search using Ctrl-F in this manual produces all the "hits" for a
+   desired term or concept.  Once you find the area in which you are
+   interested, you can display the actual manual, if desired. It is also
+   possible to use the search bar in the menu or in the left navigation pane.
 
 #. **Understand the basic concepts of how the build system works: the workflow:**
    Understanding the Yocto Project workflow is important as it can help you both
-- 
2.26.2

