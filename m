Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.4771.1623959746659937124
 for <docs@lists.yoctoproject.org>;
 Thu, 17 Jun 2021 12:55:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 8EC071BF205;
	Thu, 17 Jun 2021 19:55:44 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: JPEWhacker@gmail.com,
	docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [RFC 1/1] overview-manual: initial documentation for hash equivalence
Date: Thu, 17 Jun 2021 21:55:30 +0200
Message-Id: <20210617195530.258307-2-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210617195530.258307-1-michael.opdenacker@bootlin.com>
References: <20210617195530.258307-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/overview-manual/concepts.rst | 63 ++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index ab882ff778..bb8318ea46 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -1950,6 +1950,69 @@ another reason why a task-based approach is preferred over a
 recipe-based approach, which would have to install the output from every
 task.
 
+Hash Equivalence
+----------------
+
+The above section explained how BitBake skips the execution of tasks
+which output can already be found in the Shared State Cache.
+
+BitBake can go beyond this and also skip the execution of tasks that,
+even though the hash for their dependencies has changed, still generate
+identical output.
+
+So, even if two executions of a given task can have a different hash,
+because of potentially different sources, different environment variables
+or different output hashes for the tasks they depend on, they can be considered
+as "equivalent" as long as they generate the same output hash.
+
+Thanks to this equivalence, a change in one of the tasks in BitBake's run queue
+doesn't have to propagate to all the downstream tasks that depend on the output
+of this task, causing a full rebuild of such tasks, and so on with the next
+depending tasks. Instead, BitBake can safely retrieve all the downstream
+task output from the Shared State Cache.
+
+This applies to multiple scenarios:
+
+-  A "trivial" change to a recipe that doesn't impact its generated output,
+   such as whitespace changes, modifications to unused code paths or
+   in the ordering of variables.
+
+-  Shared library updates, for example to fix a security vulnerability.
+   For sure, the programs using such a library should be rebuilt, but
+   their new binaries should remain identical. The corresponding tasks should
+   have a different output hash because of the change in the hash of their
+   library dependency, but thanks to their output being identical, hash
+   equivalence will stop the propagation down the dependency chain.
+
+-  Native tool updates. Though the depending tasks should be rebuilt,
+   it's likely that they will generate the same output and be marked
+   as equivalent.
+
+This mechanism is enabled by default in Poky, and is controlled by two
+variables:
+
+-  :term:`bitbake:BB_HASHSERVE`, specifying a local or remote hash
+   equivalence server to use.
+
+-  :term:`bitbake:BB_SIGNATURE_HANDLER`, which must be set  to ``OEEquivHash``.
+
+Therefore, the default configuration in Poky corresponds to the
+below settings::
+
+   BB_HASHSERVE = "auto"
+   BB_SIGNATURE_HANDLER = "OEEquivHash"
+
+Another possibility is to share a hash equivalence server on a network,
+by setting::
+
+   BB_HASHSERVE = "<HOSTNAME>:<PORT>"
+
+.. note::
+
+   The hash equivalence server needs to be maintained together with the
+   share state cache. Otherwise, the server could report shared state hashes
+   that do not exist.
+
 Automatically Added Runtime Dependencies
 ========================================
 
-- 
2.25.1

