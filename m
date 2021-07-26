Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.42])
 by mx.groups.io with SMTP id smtpd.web11.31723.1627313659069421845
 for <docs@lists.yoctoproject.org>;
 Mon, 26 Jul 2021 08:34:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@cherrycloud.onmicrosoft.com header.s=selector2-cherrycloud-onmicrosoft-com header.b=OClBnn9r;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.14.42, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ie+47L7ZrtpJUbhcEouUlc9DIVgAD4LKVj7AY+qxVjut8lKyWB6IClkMVMzE2d3mdjIcU0JrkcGaJDk7PbVELJolbcUu9RGD1J/Jv4iwmQjrP3DBu9FwocZTP83AtHgm28YVXe6kW3CeEVPJ2dOIyTqvgSOgaWVjxtP33WgsKaWwM4gHgviji3gvWVPrR4VR8QqWYKfDIf8ohsvmB/v3ZnTNc4XzhXR9iiMu1wyImbWE/kxWlwuCHIjPa49Uc47iqIIjAenvKBIs4ooBkbMRAh25RGVKYYxtUWbmj0Ql/6O6GM1kVfYVB/TUsLHdef0rPetqBbKOvD89sPpPWKylzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LitwVOBW+p/kqX0b3IAmWRi9AA1+RMxDdbhnZF08ocU=;
 b=T/g1s6QcZQ1TZNaeOOyQr7CIv+VQNPax8kHy0HdLOm0IBCeaKV6ygfVdIS1k5CPvHHonY41Ugpa1V+Om+qXhjti/10VJv7SOUDVBz0Vo5Lesotbf9sQA1nLN9AMiyjpQRJWERl66Q3DoHEqKpRXlFrpJimIBg682aPfEt2ym07221q1KUy3zm0cMytTCy3tjjIfQVYbGRVit3SqMBz/N7B2RcWjI9lxDJR9Xpe/6F8SP52rkbJRP7U37gWmNzh9fMiuBtdljNWrQkOnk4HM+x/XK4Bxunk9sLAqOSmxQPxvyiGlYjwHfnh23Y6UcP793Shf1zkzWbyDy8XbZk2IDFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LitwVOBW+p/kqX0b3IAmWRi9AA1+RMxDdbhnZF08ocU=;
 b=OClBnn9rzuTDPjz/9HIkIJPmxO21Og1nc0zQUoUmhwYhobpb+w2RMXgb4MFF4Bbe2xvpCuyFNggji2VgJqeJ2LXc4bOXjh236Sk0QUtvf4W+ZZqXP2d8LdxkvifHuWuZQYRzCCvR45NeXhfmlwNcyTOMnVrje3u2tsGUMJZwnJQ=
Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM8PR04MB7412.eurprd04.prod.outlook.com
 (2603:10a6:20b:1df::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Mon, 26 Jul
 2021 15:34:15 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::459d:3240:1c4e:b920]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::459d:3240:1c4e:b920%6]) with mapi id 15.20.4352.031; Mon, 26 Jul 2021
 15:34:15 +0000
From: "Quentin Schulz" <quentin.schulz@theobroma-systems.com>
To: 
CC: docs@lists.yoctoproject.org,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Quentin Schulz <foss@0leil.net>
Subject: [PATCH] doc: bitbake-user-manual: replace ``FOO`` by :term:`FOO` where possible
Date: Mon, 26 Jul 2021 17:33:57 +0200
Message-ID: <20210726153357.2502731-1-quentin.schulz@theobroma-systems.com>
X-Mailer: git-send-email 2.31.1
X-ClientProxiedBy: FR0P281CA0052.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::20) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
Return-Path: quentin.schulz@theobroma-systems.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (92.42.140.82) by FR0P281CA0052.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:48::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.8 via Frontend Transport; Mon, 26 Jul 2021 15:34:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 22e05fdc-fb4f-4e0f-0a36-08d9504ad31b
X-MS-TrafficTypeDiagnostic: AM8PR04MB7412:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM8PR04MB7412ED3AB7BB43E0C845E902C2E89@AM8PR04MB7412.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	sJd7Gp1cijUlioZ+ZlPJcOMnNcpyYUCUCHWHgO7oqNRBFRqj7Adj/kHjFpcXgx4nQPF2Ixlq4l+l3Ho2WkalEjAj3fHbkcUEkKWBcLVf/G1u77Nffxso4dHI27ZoOWUlrQ2rEylQNTjEi3u66RdZuix+yJFpCNuFnBieD6KPGFbkhHV6MWe/nLIDArMTr61lcHMiTTkRKkCss/OsBhCGk/APDy+pKdSfMMwa+5d2SJZQKHA5vXfCy1g9ENy53QwE9nm0ATnIscndplUHGeMSgpqorT3kK3gw/h57wnqkXZLWDspot71ty4DmOhT312hSVW74OiBb9xki9ZrMTM2z6u6587kr0EFLuZpdiKZCyk7QDUQ/ucF9DCM0qudPBEUgbRx0XsqJYm7lsaCLmA4o/HsoqkVgEHg53jqXpe0gZ08ETBDJXszsBi8myw6Db+gMKSiFyrRTQgG4Dqf+YtDe6Gc9YLxW2lv0JvJofgGmjSsGu38ufZmdV+0r2MqrQeS5b2PZ4DNwtQ508XKY0unjzdc29SBa97uOs3m8lidKPfLEHlFoaL0Cdb81mu7kO/QJN+9Th76ZpNjV+fqGCMW+N/m6O2iUGi+XL8X6sDSzLs5sIJm9VhQku43a+8RQtTxAppx5QIdVF/gZ0p6tpW16EQRyuoggc7xY1bOVYFpobJrdFQqxHav5atmz5bRzgMq3Z/KHI7pV8q02FHBvERMTqhRlVFogjA7M30wWz66nXJMcheX9bD1gw0H17QxYB9s5G8XfffmSA8smXltVjQPB5Gu0/4ExAtxWnW5ComZHII1BuYkNcBUhcrgMkmJdKdYP
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(376002)(346002)(136003)(396003)(39830400003)(36756003)(956004)(478600001)(8936002)(6666004)(186003)(66946007)(4326008)(109986005)(1076003)(38350700002)(86362001)(6512007)(66556008)(2906002)(54906003)(38100700002)(83380400001)(66476007)(18074004)(52116002)(6506007)(6486002)(2616005)(5660300002)(66574015)(316002)(8676002)(44832011)(966005)(30864003)(26005)(266003)(81973001)(559001)(579004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?mZzadc++ZAWEFdg495JNaTI2qzxqljXLJ5vlpjg1y6CUHW0X/DTmPOiWSOiC?=
 =?us-ascii?Q?XHTqLTc4bzESnwWnpuc5j9BAZmONBnvPmCliH9qfz+byoAIupHRN2iyS2MFt?=
 =?us-ascii?Q?qZYYMwO4yudBqS6UcomsOFrxxl7mTKFF6CJMWGuOrgXnr9CTLIQlDrkGNNrX?=
 =?us-ascii?Q?+/fzx3N5DsQA9BxAyaOqGwCbvCt/eFikiJEDDtRxtfrgJY7pb5n09LO2F3F9?=
 =?us-ascii?Q?qqZ2mH7AAwdfmn34c0poTryjcPXZ0KjHHcadggjc8magNdLrAaXPCTXVO70H?=
 =?us-ascii?Q?mBMGSHlp5GMUy34hqJNTW8/DrQDeiGwhLcFogWxK2nEstboOuuMrPsh+atHD?=
 =?us-ascii?Q?FcJcU606nnsJseW/UCO5TzqhKWHauPP8AU4/6+9DSUfXRJjGFGfyt43GzF1k?=
 =?us-ascii?Q?yGUY3hamlxdRABQr0Y3HL6pX7rf8K6IbOHg5wGsdyWmfnJ4uriaPoSIraFpU?=
 =?us-ascii?Q?BlIS2Gs5yn/pCiJv4fwBAVY8A3Cvk66hhZ9T0MrWtiobsIhIgwIFohTEWhSo?=
 =?us-ascii?Q?CIHztLY3n2IZ1aC1Lg5xliRQImRTlyeoo+Uj/P3D/H0jC+cGYr1Lx4dMbFCe?=
 =?us-ascii?Q?dTUsjKrxmRxWdcTn3xXbnW5FW1o95gYLSguwHZZpW5Labk0xPSoOKJBnXOqI?=
 =?us-ascii?Q?Ztsu5XaW6crqXmlli0LrPIImAo8ezZon/wAh0Lx4+W5VABqfeRfNLCTA75GA?=
 =?us-ascii?Q?B6DpawI8Vuzsx6x5nSGENZ9qc6VZ3WpA3K/QJk8gvhCEQ398Ubd+5eqXv9Bo?=
 =?us-ascii?Q?MoTfzHcu22EeDiVMQO++pNDHMh4gC448h3G7CVevXorWEPvwbe/b/HkQ7Unr?=
 =?us-ascii?Q?zTx0/5WcNav2uixm8Pj95tzcBxaan/4IimSibYhWZ2zkR7PYYw1Q7bViF3vW?=
 =?us-ascii?Q?aQJg4VV4IWbyMvPvTAFdTsNssYanDKKQl4tA+SYeq7+9YLJlWBfA5DGm2iHy?=
 =?us-ascii?Q?o6R5D+3z0K9vxsXYslh0cXAroTNx6+qkl0hNrBlwo1y9cXN1JmoPzOSeZOjA?=
 =?us-ascii?Q?c8zst93HSraYFolGhe3nIvW3Opx6G/xW0qyY1FE7d4Gw9Avuccn9ndYbaxng?=
 =?us-ascii?Q?moXV24aynbvkcFx658+XHfeNZvLC58Bl0rQuZ92EFbALtAGlU0G3KFhzOsRa?=
 =?us-ascii?Q?euTRX3Yx6Mei1xakNNXWLEYsLuAqIGZg4dSBcdPdqga4g3tMNOA/dbJSCdhG?=
 =?us-ascii?Q?C+Q4XL18zU7B/PYyLxb99fSdL78TiFv5e3xLdRYWfDURwUJTUt64j5n/vC9C?=
 =?us-ascii?Q?qispSNVVd0Ekn+6xdHwK4BfTNBtN52m6un2fahrTetbx7SMrNXijfQqqCipX?=
 =?us-ascii?Q?LHw3Qo0H639rLnbCVDJlyr6C?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22e05fdc-fb4f-4e0f-0a36-08d9504ad31b
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2021 15:34:15.1021
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CmbySBvrWGaczvJ34+4a4bTZJDo5JeaLRTiLg5gAZ2iin4ga0HHdD/7BPEbFfrs/yPL61Vgz35fi64+5iriPbNT3iU9Jbx+aQOAX1b59xZ7OR6QHh/gzXzuk/C6OPVfU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7412
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

If a variable has a glossary entry and some rST files write about those
variables, it's better to point to the glossary entry instead of just
highlighting it by surrounding it with two tick quotes.

The script that is used to do the replacement of ``FOO`` by :term:`FOO`
is the following Python code:

import re
from pathlib import Path
from runpy import run_module
import contextlib
import io
import sys

re_term =3D re.compile(r'variables.html#term-([a-zA-Z_0-9]*)')
terms =3D []
new_terms =3D set()

with contextlib.redirect_stdout(io.StringIO()) as f:
    run_module('sphinx.ext.intersphinx', run_name=3D'__main__')

objects =3D f.getvalue()

match =3D re_term.search(objects)
while match:
    if match.group(1):
        terms.append(match.group(1))
    match =3D re_term.search(objects, match.end())

for rst in Path('.').rglob('*.rst'):
    with open(rst, 'r') as f:
        content =3D "".join(f.readlines())
    for term in terms:
        content =3D re.sub(r'``({})``(?!.*\s+[~=3D-]{{{:d},}})'.format(term=
, len(term)), r':term:`\1`', content)

    with open(rst, 'w') as f:
        f.write(content)

This script takes one argument as input: an objects.inv which can be
gotten from doc/_build/html/objetcs.inv after running `make html`.

Note that this excludes from replacement terms that appear in section
titles as it requires refs to be changed too. This can be automated too
if need be but right now it looks a bit confusing to have an anchor link
(for sections) also have a term/reference link in it. I am not sure this
is desired today.

Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Signed-off-by: Quentin Schulz <foss@0leil.net>
---
 .../bitbake-user-manual-execution.rst         |  54 +++----
 .../bitbake-user-manual-fetching.rst          |  20 +--
 .../bitbake-user-manual-hello.rst             |  14 +-
 .../bitbake-user-manual-intro.rst             |   4 +-
 .../bitbake-user-manual-metadata.rst          |  62 ++++----
 .../bitbake-user-manual-ref-variables.rst     | 148 +++++++++---------
 6 files changed, 151 insertions(+), 151 deletions(-)

diff --git a/doc/bitbake-user-manual/bitbake-user-manual-execution.rst b/do=
c/bitbake-user-manual/bitbake-user-manual-execution.rst
index 84d65fa9..a6ef90db 100644
--- a/doc/bitbake-user-manual/bitbake-user-manual-execution.rst
+++ b/doc/bitbake-user-manual/bitbake-user-manual-execution.rst
@@ -40,7 +40,7 @@ the BitBake command and its options, see ":ref:`The BitBa=
ke Command
    the number of processors, which takes into account hyper-threading.
    Thus, a quad-core build host with hyper-threading most likely shows
    eight processors, which is the value you would then assign to
-   ``BB_NUMBER_THREADS``.
+   :term:`BB_NUMBER_THREADS`.
=20
    A possibly simpler solution is that some Linux distributions (e.g.
    Debian and Ubuntu) provide the ``ncpus`` command.
@@ -65,13 +65,13 @@ data itself is of various types:
=20
 The ``layer.conf`` files are used to construct key variables such as
 :term:`BBPATH` and :term:`BBFILES`.
-``BBPATH`` is used to search for configuration and class files under the
-``conf`` and ``classes`` directories, respectively. ``BBFILES`` is used
+:term:`BBPATH` is used to search for configuration and class files under t=
he
+``conf`` and ``classes`` directories, respectively. :term:`BBFILES` is use=
d
 to locate both recipe and recipe append files (``.bb`` and
 ``.bbappend``). If there is no ``bblayers.conf`` file, it is assumed the
-user has set the ``BBPATH`` and ``BBFILES`` directly in the environment.
+user has set the :term:`BBPATH` and :term:`BBFILES` directly in the enviro=
nment.
=20
-Next, the ``bitbake.conf`` file is located using the ``BBPATH`` variable
+Next, the ``bitbake.conf`` file is located using the :term:`BBPATH` variab=
le
 that was just constructed. The ``bitbake.conf`` file may also include
 other configuration files using the ``include`` or ``require``
 directives.
@@ -104,7 +104,7 @@ BitBake first searches the current working directory fo=
r an optional
 contain a :term:`BBLAYERS` variable that is a
 space-delimited list of 'layer' directories. Recall that if BitBake
 cannot find a ``bblayers.conf`` file, then it is assumed the user has
-set the ``BBPATH`` and ``BBFILES`` variables directly in the
+set the :term:`BBPATH` and :term:`BBFILES` variables directly in the
 environment.
=20
 For each directory (layer) in this list, a ``conf/layer.conf`` file is
@@ -114,7 +114,7 @@ files automatically set up :term:`BBPATH` and other
 variables correctly for a given build directory.
=20
 BitBake then expects to find the ``conf/bitbake.conf`` file somewhere in
-the user-specified ``BBPATH``. That configuration file generally has
+the user-specified :term:`BBPATH`. That configuration file generally has
 include directives to pull in any other metadata such as files specific
 to the architecture, the machine, the local environment, and so forth.
=20
@@ -135,7 +135,7 @@ The ``base.bbclass`` file is always included. Other cla=
sses that are
 specified in the configuration using the
 :term:`INHERIT` variable are also included. BitBake
 searches for class files in a ``classes`` subdirectory under the paths
-in ``BBPATH`` in the same way as configuration files.
+in :term:`BBPATH` in the same way as configuration files.
=20
 A good way to get an idea of the configuration files and the class files
 used in your execution environment is to run the following BitBake
@@ -184,13 +184,13 @@ Locating and Parsing Recipes
 During the configuration phase, BitBake will have set
 :term:`BBFILES`. BitBake now uses it to construct a
 list of recipes to parse, along with any append files (``.bbappend``) to
-apply. ``BBFILES`` is a space-separated list of available files and
+apply. :term:`BBFILES` is a space-separated list of available files and
 supports wildcards. An example would be::
=20
   BBFILES =3D "/path/to/bbfiles/*.bb /path/to/appends/*.bbappend"
=20
 BitBake parses each
-recipe and append file located with ``BBFILES`` and stores the values of
+recipe and append file located with :term:`BBFILES` and stores the values =
of
 various variables into the datastore.
=20
 .. note::
@@ -201,7 +201,7 @@ For each file, a fresh copy of the base configuration i=
s made, then the
 recipe is parsed line by line. Any inherit statements cause BitBake to
 find and then parse class files (``.bbclass``) using
 :term:`BBPATH` as the search path. Finally, BitBake
-parses in order any append files found in ``BBFILES``.
+parses in order any append files found in :term:`BBFILES`.
=20
 One common convention is to use the recipe filename to define pieces of
 metadata. For example, in ``bitbake.conf`` the recipe name and version
@@ -212,7 +212,7 @@ are used to set the variables :term:`PN` and
    PV =3D "${@bb.parse.BBHandler.vars_from_file(d.getVar('FILE', False),d)=
[1] or '1.0'}"
=20
 In this example, a recipe called "something_1.2.3.bb" would set
-``PN`` to "something" and ``PV`` to "1.2.3".
+:term:`PN` to "something" and :term:`PV` to "1.2.3".
=20
 By the time parsing is complete for a recipe, BitBake has a list of
 tasks that the recipe defines and a set of data consisting of keys and
@@ -260,21 +260,21 @@ Providers
=20
 Assuming BitBake has been instructed to execute a target and that all
 the recipe files have been parsed, BitBake starts to figure out how to
-build the target. BitBake looks through the ``PROVIDES`` list for each
-of the recipes. A ``PROVIDES`` list is the list of names by which the
-recipe can be known. Each recipe's ``PROVIDES`` list is created
+build the target. BitBake looks through the :term:`PROVIDES` list for each
+of the recipes. A :term:`PROVIDES` list is the list of names by which the
+recipe can be known. Each recipe's :term:`PROVIDES` list is created
 implicitly through the recipe's :term:`PN` variable and
 explicitly through the recipe's :term:`PROVIDES`
 variable, which is optional.
=20
-When a recipe uses ``PROVIDES``, that recipe's functionality can be
-found under an alternative name or names other than the implicit ``PN``
+When a recipe uses :term:`PROVIDES`, that recipe's functionality can be
+found under an alternative name or names other than the implicit :term:`PN=
`
 name. As an example, suppose a recipe named ``keyboard_1.0.bb``
 contained the following::
=20
   PROVIDES +=3D "fullkeyboard"
=20
-The ``PROVIDES``
+The :term:`PROVIDES`
 list for this recipe becomes "keyboard", which is implicit, and
 "fullkeyboard", which is explicit. Consequently, the functionality found
 in ``keyboard_1.0.bb`` can be found under two different names.
@@ -284,12 +284,12 @@ in ``keyboard_1.0.bb`` can be found under two differe=
nt names.
 Preferences
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
-The ``PROVIDES`` list is only part of the solution for figuring out a
+The :term:`PROVIDES` list is only part of the solution for figuring out a
 target's recipes. Because targets might have multiple providers, BitBake
 needs to prioritize providers by determining provider preferences.
=20
 A common example in which a target has multiple providers is
-"virtual/kernel", which is on the ``PROVIDES`` list for each kernel
+"virtual/kernel", which is on the :term:`PROVIDES` list for each kernel
 recipe. Each machine often selects the best kernel provider by using a
 line similar to the following in the machine configuration file::
=20
@@ -309,10 +309,10 @@ specify a particular version. You can influence the o=
rder by using the
 :term:`DEFAULT_PREFERENCE` variable.
=20
 By default, files have a preference of "0". Setting
-``DEFAULT_PREFERENCE`` to "-1" makes the recipe unlikely to be used
-unless it is explicitly referenced. Setting ``DEFAULT_PREFERENCE`` to
-"1" makes it likely the recipe is used. ``PREFERRED_VERSION`` overrides
-any ``DEFAULT_PREFERENCE`` setting. ``DEFAULT_PREFERENCE`` is often used
+:term:`DEFAULT_PREFERENCE` to "-1" makes the recipe unlikely to be used
+unless it is explicitly referenced. Setting :term:`DEFAULT_PREFERENCE` to
+"1" makes it likely the recipe is used. :term:`PREFERRED_VERSION` override=
s
+any :term:`DEFAULT_PREFERENCE` setting. :term:`DEFAULT_PREFERENCE` is ofte=
n used
 to mark newer and more experimental recipe versions until they have
 undergone sufficient testing to be considered stable.
=20
@@ -394,7 +394,7 @@ ready to run, those tasks have all their dependencies m=
et, and the
 thread threshold has not been exceeded.
=20
 It is worth noting that you can greatly speed up the build time by
-properly setting the ``BB_NUMBER_THREADS`` variable.
+properly setting the :term:`BB_NUMBER_THREADS` variable.
=20
 As each task completes, a timestamp is written to the directory
 specified by the :term:`STAMP` variable. On subsequent
@@ -561,7 +561,7 @@ behavior is unchanged from previous versions. ``OE-Core=
`` uses the
=20
   BB_SIGNATURE_HANDLER ?=3D "OEBasicHash"
=20
-The "OEBasicHash" ``BB_SIGNATURE_HANDLER`` is the same as the "OEBasic"
+The "OEBasicHash" :term:`BB_SIGNATURE_HANDLER` is the same as the "OEBasic=
"
 version but adds the task hash to the stamp files. This results in any
 metadata change that changes the task hash, automatically causing the
 task to be run again. This removes the need to bump
@@ -581,7 +581,7 @@ the build. This information includes:
 -  ``BBHASHDEPS_``\ *filename:taskname*: The task dependencies for
    each task.
=20
--  ``BB_TASKHASH``: The hash of the currently running task.
+-  :term:`BB_TASKHASH`: The hash of the currently running task.
=20
 It is worth noting that BitBake's "-S" option lets you debug BitBake's
 processing of signatures. The options passed to -S allow different
diff --git a/doc/bitbake-user-manual/bitbake-user-manual-fetching.rst b/doc=
/bitbake-user-manual/bitbake-user-manual-fetching.rst
index bd1fb4fc..593de61f 100644
--- a/doc/bitbake-user-manual/bitbake-user-manual-fetching.rst
+++ b/doc/bitbake-user-manual/bitbake-user-manual-fetching.rst
@@ -51,7 +51,7 @@ This code unpacks the downloaded files to the specified b=
y ``WORKDIR``.
    examine the OpenEmbedded class file ``base.bbclass``
    .
=20
-The ``SRC_URI`` and ``WORKDIR`` variables are not hardcoded into the
+The :term:`SRC_URI` and ``WORKDIR`` variables are not hardcoded into the
 fetcher, since those fetcher methods can be (and are) called with
 different variable names. In OpenEmbedded for example, the shared state
 (sstate) code uses the fetch module to fetch the sstate files.
@@ -64,14 +64,14 @@ URLs by looking for source files in a specific search o=
rder:
    :term:`PREMIRRORS` variable.
=20
 -  *Source URI:* If pre-mirrors fail, BitBake uses the original URL (e.g
-   from ``SRC_URI``).
+   from :term:`SRC_URI`).
=20
 -  *Mirror Sites:* If fetch failures occur, BitBake next uses mirror
    locations as defined by the :term:`MIRRORS` variable.
=20
 For each URL passed to the fetcher, the fetcher calls the submodule that
 handles that particular URL type. This behavior can be the source of
-some confusion when you are providing URLs for the ``SRC_URI`` variable.
+some confusion when you are providing URLs for the :term:`SRC_URI` variabl=
e.
 Consider the following two URLs::
=20
    http://git.yoctoproject.org/git/poky;protocol=3Dgit
@@ -110,14 +110,14 @@ which is specified by the :term:`DL_DIR` variable.
 File integrity is of key importance for reproducing builds. For
 non-local archive downloads, the fetcher code can verify SHA-256 and MD5
 checksums to ensure the archives have been downloaded correctly. You can
-specify these checksums by using the ``SRC_URI`` variable with the
+specify these checksums by using the :term:`SRC_URI` variable with the
 appropriate varflags as follows::
=20
    SRC_URI[md5sum] =3D "value"
    SRC_URI[sha256sum] =3D "value"
=20
 You can also specify the checksums as
-parameters on the ``SRC_URI`` as shown below::
+parameters on the :term:`SRC_URI` as shown below::
=20
   SRC_URI =3D "http://example.com/foobar.tar.bz2;md5sum=3D4a8e0f237e961fd7=
785d19d07fdb994d"
=20
@@ -129,7 +129,7 @@ shows how you name the URIs::
    SRC_URI[foo.md5sum] =3D 4a8e0f237e961fd7785d19d07fdb994d
=20
 After a file has been downloaded and
-has had its checksum checked, a ".done" stamp is placed in ``DL_DIR``.
+has had its checksum checked, a ".done" stamp is placed in :term:`DL_DIR`.
 BitBake uses this stamp during subsequent builds to avoid downloading or
 comparing a checksum for the file again.
=20
@@ -438,7 +438,7 @@ Here are some example URLs::
 .. note::
=20
    Specifying passwords directly in ``git://`` urls is not supported.
-   There are several reasons: ``SRC_URI`` is often written out to logs and
+   There are several reasons: :term:`SRC_URI` is often written out to logs=
 and
    other places, and that could easily leak passwords; it is also all too
    easy to share metadata without removing passwords. SSH keys, ``~/.netrc=
``
    and ``~/.ssh/config`` files can be used as alternatives.
@@ -487,7 +487,7 @@ To use this fetcher, make sure your recipe has proper
 The fetcher uses the ``rcleartool`` or
 ``cleartool`` remote client, depending on which one is available.
=20
-Following are options for the ``SRC_URI`` statement:
+Following are options for the :term:`SRC_URI` statement:
=20
 -  *vob*: The name, which must include the prepending "/" character,
    of the ClearCase VOB. This option is required.
@@ -549,7 +549,7 @@ password if you do not wish to keep those values in a r=
ecipe itself. If
 you choose not to use ``P4CONFIG``, or to explicitly set variables that
 ``P4CONFIG`` can contain, you can specify the ``P4PORT`` value, which is
 the server's URL and port number, and you can specify a username and
-password directly in your recipe within ``SRC_URI``.
+password directly in your recipe within :term:`SRC_URI`.
=20
 Here is an example that relies on ``P4CONFIG`` to specify the server URL
 and port, username, and password, and fetches the Head Revision::
@@ -680,4 +680,4 @@ submodules. However, you might find the code helpful an=
d readable.
 Auto Revisions
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
-We need to document ``AUTOREV`` and ``SRCREV_FORMAT`` here.
+We need to document ``AUTOREV`` and :term:`SRCREV_FORMAT` here.
diff --git a/doc/bitbake-user-manual/bitbake-user-manual-hello.rst b/doc/bi=
tbake-user-manual/bitbake-user-manual-hello.rst
index a9c33709..c5a4ce60 100644
--- a/doc/bitbake-user-manual/bitbake-user-manual-hello.rst
+++ b/doc/bitbake-user-manual/bitbake-user-manual-hello.rst
@@ -145,23 +145,23 @@ Following is the complete "Hello World" example.
=20
     The majority of this output is specific to environment variables that
     are not directly relevant to BitBake. However, the very first
-    message regarding the ``BBPATH`` variable and the
+    message regarding the :term:`BBPATH` variable and the
     ``conf/bblayers.conf`` file is relevant.
=20
     When you run BitBake, it begins looking for metadata files. The
     :term:`BBPATH` variable is what tells BitBake where
-    to look for those files. ``BBPATH`` is not set and you need to set
-    it. Without ``BBPATH``, BitBake cannot find any configuration files
+    to look for those files. :term:`BBPATH` is not set and you need to set
+    it. Without :term:`BBPATH`, BitBake cannot find any configuration file=
s
     (``.conf``) or recipe files (``.bb``) at all. BitBake also cannot
     find the ``bitbake.conf`` file.
=20
-#.  **Setting BBPATH:** For this example, you can set ``BBPATH`` in
+#.  **Setting BBPATH:** For this example, you can set :term:`BBPATH` in
     the same manner that you set ``PATH`` earlier in the appendix. You
     should realize, though, that it is much more flexible to set the
-    ``BBPATH`` variable up in a configuration file for each project.
+    :term:`BBPATH` variable up in a configuration file for each project.
=20
     From your shell, enter the following commands to set and export the
-    ``BBPATH`` variable::
+    :term:`BBPATH` variable::
=20
       $ BBPATH=3D"projectdirectory"
       $ export BBPATH
@@ -175,7 +175,7 @@ Following is the complete "Hello World" example.
        ("~") character as BitBake does not expand that character as the
        shell would.
=20
-#.  **Run BitBake:** Now that you have ``BBPATH`` defined, run the
+#.  **Run BitBake:** Now that you have :term:`BBPATH` defined, run the
     ``bitbake`` command again::
=20
        $ bitbake
diff --git a/doc/bitbake-user-manual/bitbake-user-manual-intro.rst b/doc/bi=
tbake-user-manual/bitbake-user-manual-intro.rst
index b3cea61f..eb140665 100644
--- a/doc/bitbake-user-manual/bitbake-user-manual-intro.rst
+++ b/doc/bitbake-user-manual/bitbake-user-manual-intro.rst
@@ -537,7 +537,7 @@ current working directory:
 To stop depending on common depends, use the "-I" depend option and
 BitBake omits them from the graph. Leaving this information out can
 produce more readable graphs. This way, you can remove from the graph
-``DEPENDS`` from inherited classes such as ``base.bbclass``.
+:term:`DEPENDS` from inherited classes such as ``base.bbclass``.
=20
 Here are two examples that create dependency graphs. The second example
 omits depends common in OpenEmbedded from the graph::
@@ -564,7 +564,7 @@ for two separate targets:
 .. image:: figures/bb_multiconfig_files.png
    :align: center
=20
-The reason for this required file hierarchy is because the ``BBPATH``
+The reason for this required file hierarchy is because the :term:`BBPATH`
 variable is not constructed until the layers are parsed. Consequently,
 using the configuration file as a pre-configuration file is not possible
 unless it is located in the current working directory.
diff --git a/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst b/doc=
/bitbake-user-manual/bitbake-user-manual-metadata.rst
index 20c330e6..3e14163e 100644
--- a/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst
+++ b/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst
@@ -225,7 +225,7 @@ immediately, rather than when the variable is actually =
used::
    C :=3D "${C}append"
=20
 In this example, ``A`` contains "test 123", even though the final value
-of ``T`` is "456". The variable ``B`` will end up containing "456
+of :term:`T` is "456". The variable :term:`B` will end up containing "456
 cvalappend". This is because references to undefined variables are
 preserved as is during (immediate)expansion. This is in contrast to GNU
 Make, where undefined variables expand to nothing. The variable ``C``
@@ -248,7 +248,7 @@ examples::
    C =3D "cval"
    C =3D+ "test"
=20
-The variable ``B`` contains "bval additionaldata" and ``C`` contains "test
+The variable :term:`B` contains "bval additionaldata" and ``C`` contains "=
test
 cval".
=20
 .. _appending-and-prepending-without-spaces:
@@ -267,7 +267,7 @@ examples::
    C =3D "cval"
    C =3D. "test"
=20
-The variable ``B`` contains "bvaladditionaldata" and ``C`` contains
+The variable :term:`B` contains "bvaladditionaldata" and ``C`` contains
 "testcval".
=20
 Appending and Prepending (Override Style Syntax)
@@ -287,7 +287,7 @@ rather than being immediately applied. Here are some ex=
amples::
    D =3D "dval"
    D_append =3D "additional data"
=20
-The variable ``B``
+The variable :term:`B`
 becomes "bval additional data" and ``C`` becomes "additional data cval".
 The variable ``D`` becomes "dvaladditional data".
=20
@@ -496,14 +496,14 @@ Conditional Syntax (Overrides)
=20
 BitBake uses :term:`OVERRIDES` to control what
 variables are overridden after BitBake parses recipes and configuration
-files. This section describes how you can use ``OVERRIDES`` as
+files. This section describes how you can use :term:`OVERRIDES` as
 conditional metadata, talks about key expansion in relationship to
-``OVERRIDES``, and provides some examples to help with understanding.
+:term:`OVERRIDES`, and provides some examples to help with understanding.
=20
 Conditional Metadata
 --------------------
=20
-You can use ``OVERRIDES`` to conditionally select a specific version of
+You can use :term:`OVERRIDES` to conditionally select a specific version o=
f
 a variable and to conditionally append or prepend the value of a
 variable.
=20
@@ -513,10 +513,10 @@ variable.
    underscores are not permitted in override names as they are used to
    separate overrides from each other and from the variable name.
=20
--  *Selecting a Variable:* The ``OVERRIDES`` variable is a
+-  *Selecting a Variable:* The :term:`OVERRIDES` variable is a
    colon-character-separated list that contains items for which you want
    to satisfy conditions. Thus, if you have a variable that is
-   conditional on "arm", and "arm" is in ``OVERRIDES``, then the
+   conditional on "arm", and "arm" is in :term:`OVERRIDES`, then the
    "arm"-specific version of the variable is used rather than the
    non-conditional version. Here is an example::
=20
@@ -525,7 +525,7 @@ variable.
       TEST_os =3D "osspecific"
       TEST_nooverride =3D "othercondvalue"
=20
-   In this example, the ``OVERRIDES``
+   In this example, the :term:`OVERRIDES`
    variable lists three overrides: "architecture", "os", and "machine".
    The variable ``TEST`` by itself has a default value of "default". You
    select the os-specific version of the ``TEST`` variable by appending
@@ -547,13 +547,13 @@ variable.
=20
 -  *Appending and Prepending:* BitBake also supports append and prepend
    operations to variable values based on whether a specific item is
-   listed in ``OVERRIDES``. Here is an example::
+   listed in :term:`OVERRIDES`. Here is an example::
=20
       DEPENDS =3D "glibc ncurses"
       OVERRIDES =3D "machine:local"
       DEPENDS_append_machine =3D "libmad"
=20
-   In this example, ``DEPENDS`` becomes "glibc ncurses libmad".
+   In this example, :term:`DEPENDS` becomes "glibc ncurses libmad".
=20
    Again, using an OpenEmbedded metadata-based kernel recipe file as an
    example, the following lines will conditionally append to the
@@ -627,7 +627,7 @@ not been applied yet, ``A_foo`` is set to "X" due to th=
e append and
 ``A`` simply equals "Z".
=20
 Applying overrides, however, changes things. Since "foo" is listed in
-``OVERRIDES``, the conditional variable ``A`` is replaced with the "foo"
+:term:`OVERRIDES`, the conditional variable ``A`` is replaced with the "fo=
o"
 version, which is equal to "X". So effectively, ``A_foo`` replaces
 ``A``.
=20
@@ -686,7 +686,7 @@ share the task.
=20
 This section presents the mechanisms BitBake provides to allow you to
 share functionality between recipes. Specifically, the mechanisms
-include ``include``, ``inherit``, ``INHERIT``, and ``require``
+include ``include``, ``inherit``, :term:`INHERIT`, and ``require``
 directives.
=20
 Locating Include and Class Files
@@ -702,7 +702,7 @@ current directory for ``include`` and ``require`` direc=
tives.
=20
 In order for include and class files to be found by BitBake, they need
 to be located in a "classes" subdirectory that can be found in
-``BBPATH``.
+:term:`BBPATH`.
=20
 ``inherit`` Directive
 ---------------------
@@ -725,7 +725,7 @@ functionality for using Autotools that could be shared =
across recipes::
    inherit autotools
=20
 In this case, BitBake would search for the directory
-``classes/autotools.bbclass`` in ``BBPATH``.
+``classes/autotools.bbclass`` in :term:`BBPATH`.
=20
 .. note::
=20
@@ -780,7 +780,7 @@ BitBake understands the ``include`` directive. This dir=
ective causes
 BitBake to parse whatever file you specify, and to insert that file at
 that location. The directive is much like its equivalent in Make except
 that if the path specified on the include line is a relative path,
-BitBake locates the first file it can find within ``BBPATH``.
+BitBake locates the first file it can find within :term:`BBPATH`.
=20
 The include directive is a more generic method of including
 functionality as compared to the :ref:`inherit <bitbake-user-manual/bitbak=
e-user-manual-metadata:\`\`inherit\`\` directive>`
@@ -822,7 +822,7 @@ does not suit a ``.bbclass`` file.
=20
 Similar to how BitBake handles :ref:`include <bitbake-user-manual/bitbake-=
user-manual-metadata:\`\`include\`\` directive>`, if
 the path specified on the require line is a relative path, BitBake
-locates the first file it can find within ``BBPATH``.
+locates the first file it can find within :term:`BBPATH`.
=20
 As an example, suppose you have two versions of a recipe (e.g.
 ``foo_1.2.2.bb`` and ``foo_2.0.0.bb``) where each version contains some
@@ -851,7 +851,7 @@ As an example, suppose you needed to inherit a class fi=
le called
 This configuration directive causes the named class to be inherited at
 the point of the directive during parsing. As with the ``inherit``
 directive, the ``.bbclass`` file must be located in a "classes"
-subdirectory in one of the directories specified in ``BBPATH``.
+subdirectory in one of the directories specified in :term:`BBPATH`.
=20
 .. note::
=20
@@ -1015,7 +1015,7 @@ is an example::
    SOMECONDITION =3D "1"
    DEPENDS =3D "${@get_depends(d)}"
=20
-This would result in ``DEPENDS`` containing ``dependencywithcond``.
+This would result in :term:`DEPENDS` containing ``dependencywithcond``.
=20
 Here are some things to know about Python functions:
=20
@@ -1382,7 +1382,7 @@ Sometimes, it is useful to be able to obtain informat=
ion from the
 original execution environment. BitBake saves a copy of the original
 environment into a special variable named :term:`BB_ORIGENV`.
=20
-The ``BB_ORIGENV`` variable returns a datastore object that can be
+The :term:`BB_ORIGENV` variable returns a datastore object that can be
 queried using the standard datastore operators such as
 ``getVar(, False)``. The datastore object is useful, for example, to
 find the original ``DISPLAY`` variable. Here is an example::
@@ -1467,7 +1467,7 @@ functionality of the task:
          can result in unpredictable behavior.
=20
       -  Setting the varflag to a value greater than the value used in
-         the ``BB_NUMBER_THREADS`` variable causes ``number_threads`` to
+         the :term:`BB_NUMBER_THREADS` variable causes ``number_threads`` =
to
          have no effect.
=20
 -  ``[postfuncs]``: List of functions to call after the completion of
@@ -1537,7 +1537,7 @@ intent is to make it easy to do things like email not=
ification on build
 failures.
=20
 Following is an example event handler that prints the name of the event
-and the content of the ``FILE`` variable::
+and the content of the :term:`FILE` variable::
=20
    addhandler myclass_eventhandler
    python myclass_eventhandler() {
@@ -1576,7 +1576,7 @@ might have an interest in viewing:
=20
 -  ``bb.event.ConfigParsed()``: Fired when the base configuration; which
    consists of ``bitbake.conf``, ``base.bbclass`` and any global
-   ``INHERIT`` statements; has been parsed. You can see multiple such
+   :term:`INHERIT` statements; has been parsed. You can see multiple such
    events when each of the workers parse the base configuration or if
    the server changes configuration and reparses. Any given datastore
    only has one such event executed against it, however. If
@@ -1733,13 +1733,13 @@ Build Dependencies
=20
 BitBake uses the :term:`DEPENDS` variable to manage
 build time dependencies. The ``[deptask]`` varflag for tasks signifies
-the task of each item listed in ``DEPENDS`` that must complete before
+the task of each item listed in :term:`DEPENDS` that must complete before
 that task can be executed. Here is an example::
=20
    do_configure[deptask] =3D "do_populate_sysroot"
=20
 In this example, the ``do_populate_sysroot`` task
-of each item in ``DEPENDS`` must complete before ``do_configure`` can
+of each item in :term:`DEPENDS` must complete before ``do_configure`` can
 execute.
=20
 Runtime Dependencies
@@ -1748,8 +1748,8 @@ Runtime Dependencies
 BitBake uses the :term:`PACKAGES`, :term:`RDEPENDS`, and :term:`RRECOMMEND=
S`
 variables to manage runtime dependencies.
=20
-The ``PACKAGES`` variable lists runtime packages. Each of those packages
-can have ``RDEPENDS`` and ``RRECOMMENDS`` runtime dependencies. The
+The :term:`PACKAGES` variable lists runtime packages. Each of those packag=
es
+can have :term:`RDEPENDS` and :term:`RRECOMMENDS` runtime dependencies. Th=
e
 ``[rdeptask]`` flag for tasks is used to signify the task of each item
 runtime dependency which must have completed before that task can be
 executed. ::
@@ -1757,9 +1757,9 @@ executed. ::
    do_package_qa[rdeptask] =3D "do_packagedata"
=20
 In the previous
-example, the ``do_packagedata`` task of each item in ``RDEPENDS`` must
+example, the ``do_packagedata`` task of each item in :term:`RDEPENDS` must
 have completed before ``do_package_qa`` can execute.
-Although ``RDEPENDS`` contains entries from the
+Although :term:`RDEPENDS` contains entries from the
 runtime dependency namespace, BitBake knows how to map them back
 to the build-time dependency namespace, in which the tasks are defined.
=20
@@ -1802,7 +1802,7 @@ Inter-Task Dependencies
 BitBake uses the ``[depends]`` flag in a more generic form to manage
 inter-task dependencies. This more generic form allows for
 inter-dependency checks for specific tasks rather than checks for the
-data in ``DEPENDS``. Here is an example::
+data in :term:`DEPENDS`. Here is an example::
=20
    do_patch[depends] =3D "quilt-native:do_populate_sysroot"
=20
diff --git a/doc/bitbake-user-manual/bitbake-user-manual-ref-variables.rst =
b/doc/bitbake-user-manual/bitbake-user-manual-ref-variables.rst
index 2dca52c4..57a759f1 100644
--- a/doc/bitbake-user-manual/bitbake-user-manual-ref-variables.rst
+++ b/doc/bitbake-user-manual/bitbake-user-manual-ref-variables.rst
@@ -30,7 +30,7 @@ overview of their function and contents.
       attempt to build. Instead, BitBake assumes these recipes have alread=
y
       been built.
=20
-      In OpenEmbedded-Core, ``ASSUME_PROVIDED`` mostly specifies native
+      In OpenEmbedded-Core, :term:`ASSUME_PROVIDED` mostly specifies nativ=
e
       tools that should not be built. An example is ``git-native``, which
       when specified allows for the Git binary from the host to be used
       rather than building ``git-native``.
@@ -83,14 +83,14 @@ overview of their function and contents.
=20
       -  Attempts to access networks not in the host list cause a failure.
=20
-      Using ``BB_ALLOWED_NETWORKS`` in conjunction with
+      Using :term:`BB_ALLOWED_NETWORKS` in conjunction with
       :term:`PREMIRRORS` is very useful. Adding the
-      host you want to use to ``PREMIRRORS`` results in the source code
+      host you want to use to :term:`PREMIRRORS` results in the source cod=
e
       being fetched from an allowed location and avoids raising an error
       when a host that is not allowed is in a
       :term:`SRC_URI` statement. This is because the
-      fetcher does not attempt to use the host listed in ``SRC_URI`` after
-      a successful fetch from the ``PREMIRRORS`` occurs.
+      fetcher does not attempt to use the host listed in :term:`SRC_URI` a=
fter
+      a successful fetch from the :term:`PREMIRRORS` occurs.
=20
    :term:`BB_CONSOLELOG`
       Specifies the path to a log file into which BitBake's user interface
@@ -177,7 +177,7 @@ overview of their function and contents.
       issues a warning when the disk space in the ``${SSTATE_DIR}``
       directory drops below 1 Gbyte or the number of free inodes drops
       below 100 Kbytes. Subsequent warnings are issued during intervals as
-      defined by the ``BB_DISKMON_WARNINTERVAL`` variable.
+      defined by the :term:`BB_DISKMON_WARNINTERVAL` variable.
=20
       The second example stops the build after all currently executing
       tasks complete when the minimum disk space in the ``${TMPDIR}``
@@ -191,14 +191,14 @@ overview of their function and contents.
    :term:`BB_DISKMON_WARNINTERVAL`
       Defines the disk space and free inode warning intervals.
=20
-      If you are going to use the ``BB_DISKMON_WARNINTERVAL`` variable, yo=
u
+      If you are going to use the :term:`BB_DISKMON_WARNINTERVAL` variable=
, you
       must also use the :term:`BB_DISKMON_DIRS`
       variable and define its action as "WARN". During the build,
       subsequent warnings are issued each time disk space or number of fre=
e
       inodes further reduces by the respective interval.
=20
-      If you do not provide a ``BB_DISKMON_WARNINTERVAL`` variable and you
-      do use ``BB_DISKMON_DIRS`` with the "WARN" action, the disk
+      If you do not provide a :term:`BB_DISKMON_WARNINTERVAL` variable and=
 you
+      do use :term:`BB_DISKMON_DIRS` with the "WARN" action, the disk
       monitoring interval defaults to the following:
       BB_DISKMON_WARNINTERVAL =3D "50M,5K"
=20
@@ -263,7 +263,7 @@ overview of their function and contents.
    :term:`BB_FILENAME`
       Contains the filename of the recipe that owns the currently running
       task. For example, if the ``do_fetch`` task that resides in the
-      ``my-recipe.bb`` is executing, the ``BB_FILENAME`` variable contains
+      ``my-recipe.bb`` is executing, the :term:`BB_FILENAME` variable cont=
ains
       "/foo/path/my-recipe.bb".
=20
    :term:`BB_GENERATE_MIRROR_TARBALLS`
@@ -333,7 +333,7 @@ overview of their function and contents.
=20
    :term:`BB_LOGFMT`
       Specifies the name of the log files saved into
-      ``${``\ :term:`T`\ ``}``. By default, the ``BB_LOGFMT``
+      ``${``\ :term:`T`\ ``}``. By default, the :term:`BB_LOGFMT`
       variable is undefined and the log file names get created using the
       following form::
=20
@@ -388,7 +388,7 @@ overview of their function and contents.
    :term:`BB_RUNFMT`
       Specifies the name of the executable script files (i.e. run files)
       saved into ``${``\ :term:`T`\ ``}``. By default, the
-      ``BB_RUNFMT`` variable is undefined and the run file names get
+      :term:`BB_RUNFMT` variable is undefined and the run file names get
       created using the following form::
=20
          run.{task}.{pid}
@@ -454,7 +454,7 @@ overview of their function and contents.
    :term:`BB_SRCREV_POLICY`
       Defines the behavior of the fetcher when it interacts with source
       control systems and dynamic source revisions. The
-      ``BB_SRCREV_POLICY`` variable is useful when working without a
+      :term:`BB_SRCREV_POLICY` variable is useful when working without a
       network.
=20
       The variable can be set using one of two policies:
@@ -498,7 +498,7 @@ overview of their function and contents.
       Allows adjustment of a task's Input/Output priority. During
       Autobuilder testing, random failures can occur for tasks due to I/O
       starvation. These failures occur during various QEMU runtime
-      timeouts. You can use the ``BB_TASK_IONICE_LEVEL`` variable to adjus=
t
+      timeouts. You can use the :term:`BB_TASK_IONICE_LEVEL` variable to a=
djust
       the I/O priority of these tasks.
=20
       .. note::
@@ -572,13 +572,13 @@ overview of their function and contents.
=20
       .. note::
=20
-         Internally, the ``BBCLASSEXTEND`` mechanism generates recipe
+         Internally, the :term:`BBCLASSEXTEND` mechanism generates recipe
          variants by rewriting variable values and applying overrides such
          as ``_class-native``. For example, to generate a native version o=
f
          a recipe, a :term:`DEPENDS` on "foo" is
-         rewritten to a ``DEPENDS`` on "foo-native".
+         rewritten to a :term:`DEPENDS` on "foo-native".
=20
-         Even when using ``BBCLASSEXTEND``, the recipe is only parsed once=
.
+         Even when using :term:`BBCLASSEXTEND`, the recipe is only parsed =
once.
          Parsing once adds some limitations. For example, it is not
          possible to include a different file depending on the variant,
          since ``include`` statements are processed when the recipe is
@@ -614,14 +614,14 @@ overview of their function and contents.
       - effectively letting you control the precedence for the multiple
       layers. The precedence established through this variable stands
       regardless of a recipe's version (:term:`PV` variable).
-      For example, a layer that has a recipe with a higher ``PV`` value bu=
t
-      for which the ``BBFILE_PRIORITY`` is set to have a lower precedence
+      For example, a layer that has a recipe with a higher :term:`PV` valu=
e but
+      for which the :term:`BBFILE_PRIORITY` is set to have a lower precede=
nce
       still has a lower precedence.
=20
-      A larger value for the ``BBFILE_PRIORITY`` variable results in a
+      A larger value for the :term:`BBFILE_PRIORITY` variable results in a
       higher precedence. For example, the value 6 has a higher precedence
-      than the value 5. If not specified, the ``BBFILE_PRIORITY`` variable
-      is set based on layer dependencies (see the ``LAYERDEPENDS`` variabl=
e
+      than the value 5. If not specified, the :term:`BBFILE_PRIORITY` vari=
able
+      is set based on layer dependencies (see the :term:`LAYERDEPENDS` var=
iable
       for more information. The default priority, if unspecified for a
       layer with no dependencies, is the lowest defined priority + 1 (or 1
       if no priorities are defined).
@@ -644,7 +644,7 @@ overview of their function and contents.
       Activates content depending on presence of identified layers.  You
       identify the layers by the collections that the layers define.
=20
-      Use the ``BBFILES_DYNAMIC`` variable to avoid ``.bbappend`` files wh=
ose
+      Use the :term:`BBFILES_DYNAMIC` variable to avoid ``.bbappend`` file=
s whose
       corresponding ``.bb`` file is in a layer that attempts to modify oth=
er
       layers through ``.bbappend`` but does not want to introduce a hard
       dependency on those other layers.
@@ -653,7 +653,7 @@ overview of their function and contents.
       ``.bb`` files in case a layer is not present.  Use this avoid hard
       dependency on those other layers.
=20
-      Use the following form for ``BBFILES_DYNAMIC``::
+      Use the following form for :term:`BBFILES_DYNAMIC`::
=20
          collection_name:filename_pattern
=20
@@ -690,7 +690,7 @@ overview of their function and contents.
    :term:`BBINCLUDELOGS_LINES`
       If :term:`BBINCLUDELOGS` is set, specifies
       the maximum number of lines from the task log file to print when
-      reporting a failed task. If you do not set ``BBINCLUDELOGS_LINES``,
+      reporting a failed task. If you do not set :term:`BBINCLUDELOGS_LINE=
S`,
       the entire log is printed.
=20
    :term:`BBLAYERS`
@@ -716,7 +716,7 @@ overview of their function and contents.
    :term:`BBMASK`
       Prevents BitBake from processing recipes and recipe append files.
=20
-      You can use the ``BBMASK`` variable to "hide" these ``.bb`` and
+      You can use the :term:`BBMASK` variable to "hide" these ``.bb`` and
       ``.bbappend`` files. BitBake ignores any recipe or recipe append
       files that match any of the expressions. It is as if BitBake does no=
t
       see them at all. Consequently, matching files are not parsed or
@@ -753,7 +753,7 @@ overview of their function and contents.
       Enables BitBake to perform multiple configuration builds and lists
       each separate configuration (multiconfig). You can use this variable
       to cause BitBake to build multiple targets where each target has a
-      separate configuration. Define ``BBMULTICONFIG`` in your
+      separate configuration. Define :term:`BBMULTICONFIG` in your
       ``conf/local.conf`` configuration file.
=20
       As an example, the following line specifies three multiconfigs, each
@@ -765,7 +765,7 @@ overview of their function and contents.
       build directory within a directory named ``conf/multiconfig`` (e.g.
       build_directory\ ``/conf/multiconfig/configA.conf``).
=20
-      For information on how to use ``BBMULTICONFIG`` in an environment
+      For information on how to use :term:`BBMULTICONFIG` in an environmen=
t
       that supports building targets with multiple configurations, see the
       ":ref:`bitbake-user-manual/bitbake-user-manual-intro:executing a mul=
tiple configuration build`"
       section.
@@ -776,7 +776,7 @@ overview of their function and contents.
       variable.
=20
       If you run BitBake from a directory outside of the build directory,
-      you must be sure to set ``BBPATH`` to point to the build directory.
+      you must be sure to set :term:`BBPATH` to point to the build directo=
ry.
       Set the variable as you would any environment variable and then run
       BitBake::
=20
@@ -823,7 +823,7 @@ overview of their function and contents.
       The most common usage of this is variable is to set it to "-1" withi=
n
       a recipe for a development version of a piece of software. Using the
       variable in this way causes the stable version of the recipe to buil=
d
-      by default in the absence of ``PREFERRED_VERSION`` being used to
+      by default in the absence of :term:`PREFERRED_VERSION` being used to
       build the development version.
=20
       .. note::
@@ -836,7 +836,7 @@ overview of their function and contents.
       Lists a recipe's build-time dependencies (i.e. other recipe files).
=20
       Consider this simple example for two recipes named "a" and "b" that
-      produce similarly named packages. In this example, the ``DEPENDS``
+      produce similarly named packages. In this example, the :term:`DEPEND=
S`
       statement appears in the "a" recipe::
=20
          DEPENDS =3D "b"
@@ -854,7 +854,7 @@ overview of their function and contents.
=20
    :term:`DL_DIR`
       The central download directory used by the build process to store
-      downloads. By default, ``DL_DIR`` gets files suitable for mirroring =
for
+      downloads. By default, :term:`DL_DIR` gets files suitable for mirror=
ing for
       everything except Git repositories. If you want tarballs of Git
       repositories, use the :term:`BB_GENERATE_MIRROR_TARBALLS` variable.
=20
@@ -869,14 +869,14 @@ overview of their function and contents.
=20
       .. note::
=20
-         Recipes added to ``EXCLUDE_FROM_WORLD`` may still be built during=
 a world
+         Recipes added to :term:`EXCLUDE_FROM_WORLD` may still be built du=
ring a world
          build in order to satisfy dependencies of other recipes. Adding a
-         recipe to ``EXCLUDE_FROM_WORLD`` only ensures that the recipe is =
not
+         recipe to :term:`EXCLUDE_FROM_WORLD` only ensures that the recipe=
 is not
          explicitly added to the list of build targets in a world build.
=20
    :term:`FAKEROOT`
       Contains the command to use when running a shell script in a fakeroo=
t
-      environment. The ``FAKEROOT`` variable is obsolete and has been
+      environment. The :term:`FAKEROOT` variable is obsolete and has been
       replaced by the other ``FAKEROOT*`` variables. See these entries in
       the glossary for more information.
=20
@@ -939,9 +939,9 @@ overview of their function and contents.
       Causes the named class or classes to be inherited globally. Anonymou=
s
       functions in the class or classes are not executed for the base
       configuration and in each individual recipe. The OpenEmbedded build
-      system ignores changes to ``INHERIT`` in individual recipes.
+      system ignores changes to :term:`INHERIT` in individual recipes.
=20
-      For more information on ``INHERIT``, see the
+      For more information on :term:`INHERIT`, see the
       ":ref:`bitbake-user-manual/bitbake-user-manual-metadata:\`\`inherit\=
`\` configuration directive`"
       section.
=20
@@ -989,7 +989,7 @@ overview of their function and contents.
       the build system searches for source code, it first tries the local
       download directory. If that location fails, the build system tries
       locations defined by :term:`PREMIRRORS`, the
-      upstream source, and then locations specified by ``MIRRORS`` in that
+      upstream source, and then locations specified by :term:`MIRRORS` in =
that
       order.
=20
    :term:`MULTI_PROVIDER_WHITELIST`
@@ -1006,12 +1006,12 @@ overview of their function and contents.
       ``virtual/kernel``, and so forth).
=20
    :term:`OVERRIDES`
-      BitBake uses ``OVERRIDES`` to control what variables are overridden
+      BitBake uses :term:`OVERRIDES` to control what variables are overrid=
den
       after BitBake parses recipes and configuration files.
=20
       Following is a simple example that uses an overrides list based on
       machine architectures: OVERRIDES =3D "arm:x86:mips:powerpc" You can
-      find information on how to use ``OVERRIDES`` in the
+      find information on how to use :term:`OVERRIDES` in the
       ":ref:`bitbake-user-manual/bitbake-user-manual-metadata:conditional =
syntax
       (overrides)`" section.
=20
@@ -1025,11 +1025,11 @@ overview of their function and contents.
    :term:`PACKAGES_DYNAMIC`
       A promise that your recipe satisfies runtime dependencies for
       optional modules that are found in other recipes.
-      ``PACKAGES_DYNAMIC`` does not actually satisfy the dependencies, it
+      :term:`PACKAGES_DYNAMIC` does not actually satisfy the dependencies,=
 it
       only states that they should be satisfied. For example, if a hard,
       runtime dependency (:term:`RDEPENDS`) of another
       package is satisfied during the build through the
-      ``PACKAGES_DYNAMIC`` variable, but a package with the module name is
+      :term:`PACKAGES_DYNAMIC` variable, but a package with the module nam=
e is
       never actually produced, then the other package will be broken.
=20
    :term:`PE`
@@ -1068,8 +1068,8 @@ overview of their function and contents.
    :term:`PREFERRED_PROVIDERS`
       Determines which recipe should be given preference for cases where
       multiple recipes provide the same item. Functionally,
-      ``PREFERRED_PROVIDERS`` is identical to
-      :term:`PREFERRED_PROVIDER`. However, the ``PREFERRED_PROVIDERS`` var=
iable
+      :term:`PREFERRED_PROVIDERS` is identical to
+      :term:`PREFERRED_PROVIDER`. However, the :term:`PREFERRED_PROVIDERS`=
 variable
       lets you define preferences for multiple situations using the follow=
ing
       form::
=20
@@ -1087,7 +1087,7 @@ overview of their function and contents.
       select, and you should set :term:`PV` accordingly for
       precedence.
=20
-      The ``PREFERRED_VERSION`` variable supports limited wildcard use
+      The :term:`PREFERRED_VERSION` variable supports limited wildcard use
       through the "``%``" character. You can use the character to match an=
y
       number of characters, which can be useful when specifying versions
       that contain long revision numbers that potentially change. Here are
@@ -1110,7 +1110,7 @@ overview of their function and contents.
       Specifies additional paths from which BitBake gets source code. When
       the build system searches for source code, it first tries the local
       download directory. If that location fails, the build system tries
-      locations defined by ``PREMIRRORS``, the upstream source, and then
+      locations defined by :term:`PREMIRRORS`, the upstream source, and th=
en
       locations specified by :term:`MIRRORS` in that order.
=20
       Typically, you would add a specific server for the build system to
@@ -1130,25 +1130,25 @@ overview of their function and contents.
=20
    :term:`PROVIDES`
       A list of aliases by which a particular recipe can be known. By
-      default, a recipe's own ``PN`` is implicitly already in its
-      ``PROVIDES`` list. If a recipe uses ``PROVIDES``, the additional
+      default, a recipe's own :term:`PN` is implicitly already in its
+      :term:`PROVIDES` list. If a recipe uses :term:`PROVIDES`, the additi=
onal
       aliases are synonyms for the recipe and can be useful satisfying
       dependencies of other recipes during the build as specified by
-      ``DEPENDS``.
+      :term:`DEPENDS`.
=20
-      Consider the following example ``PROVIDES`` statement from a recipe
+      Consider the following example :term:`PROVIDES` statement from a rec=
ipe
       file ``libav_0.8.11.bb``::
=20
          PROVIDES +=3D "libpostproc"
=20
-      The ``PROVIDES`` statement results in the "libav" recipe also being =
known
+      The :term:`PROVIDES` statement results in the "libav" recipe also be=
ing known
       as "libpostproc".
=20
       In addition to providing recipes under alternate names, the
-      ``PROVIDES`` mechanism is also used to implement virtual targets. A
+      :term:`PROVIDES` mechanism is also used to implement virtual targets=
. A
       virtual target is a name that corresponds to some particular
       functionality (e.g. a Linux kernel). Recipes that provide the
-      functionality in question list the virtual target in ``PROVIDES``.
+      functionality in question list the virtual target in :term:`PROVIDES=
`.
       Recipes that depend on the functionality in question can include the
       virtual target in :term:`DEPENDS` to leave the
       choice of provider open.
@@ -1160,12 +1160,12 @@ overview of their function and contents.
    :term:`PRSERV_HOST`
       The network based :term:`PR` service host and port.
=20
-      Following is an example of how the ``PRSERV_HOST`` variable is set::
+      Following is an example of how the :term:`PRSERV_HOST` variable is s=
et::
=20
          PRSERV_HOST =3D "localhost:0"
=20
       You must set the variable if you want to automatically start a local=
 PR
-      service. You can set ``PRSERV_HOST`` to other values to use a remote=
 PR
+      service. You can set :term:`PRSERV_HOST` to other values to use a re=
mote PR
       service.
=20
    :term:`PV`
@@ -1177,22 +1177,22 @@ overview of their function and contents.
       a package in this list cannot be found during the build, you will ge=
t
       a build error.
=20
-      Because the ``RDEPENDS`` variable applies to packages being built,
+      Because the :term:`RDEPENDS` variable applies to packages being buil=
t,
       you should always use the variable in a form with an attached packag=
e
       name. For example, suppose you are building a development package
       that depends on the ``perl`` package. In this case, you would use th=
e
-      following ``RDEPENDS`` statement::
+      following :term:`RDEPENDS` statement::
=20
          RDEPENDS_${PN}-dev +=3D "perl"
=20
       In the example, the development package depends on the ``perl`` pack=
age.
-      Thus, the ``RDEPENDS`` variable has the ``${PN}-dev`` package name a=
s part
+      Thus, the :term:`RDEPENDS` variable has the ``${PN}-dev`` package na=
me as part
       of the variable.
=20
       BitBake supports specifying versioned dependencies. Although the
       syntax varies depending on the packaging format, BitBake hides these
       differences from you. Here is the general syntax to specify versions
-      with the ``RDEPENDS`` variable::
+      with the :term:`RDEPENDS` variable::
=20
          RDEPENDS_${PN} =3D "package (operator version)"
=20
@@ -1218,19 +1218,19 @@ overview of their function and contents.
=20
    :term:`REQUIRED_VERSION`
       If there are multiple versions of a recipe available, this variable
-      determines which version should be given preference. ``REQUIRED_VERS=
ION``
+      determines which version should be given preference. :term:`REQUIRED=
_VERSION`
       works in exactly the same manner as :term:`PREFERRED_VERSION`, excep=
t
       that if the specified version is not available then an error message
       is shown and the build fails immediately.
=20
-      If both ``REQUIRED_VERSION`` and ``PREFERRED_VERSION`` are set for
-      the same recipe, the ``REQUIRED_VERSION`` value applies.
+      If both :term:`REQUIRED_VERSION` and :term:`PREFERRED_VERSION` are s=
et for
+      the same recipe, the :term:`REQUIRED_VERSION` value applies.
=20
    :term:`RPROVIDES`
       A list of package name aliases that a package also provides. These
       aliases are useful for satisfying runtime dependencies of other
       packages both during the build and on the target (as specified by
-      ``RDEPENDS``).
+      :term:`RDEPENDS`).
=20
       As with all package-controlling variables, you must always use the
       variable in conjunction with a package name override. Here is an
@@ -1243,12 +1243,12 @@ overview of their function and contents.
       built. The package being built does not depend on this list of
       packages in order to successfully build, but needs them for the
       extended usability. To specify runtime dependencies for packages, se=
e
-      the ``RDEPENDS`` variable.
+      the :term:`RDEPENDS` variable.
=20
       BitBake supports specifying versioned recommends. Although the synta=
x
       varies depending on the packaging format, BitBake hides these
       differences from you. Here is the general syntax to specify versions
-      with the ``RRECOMMENDS`` variable::
+      with the :term:`RRECOMMENDS` variable::
=20
          RRECOMMENDS_${PN} =3D "package (operator version)"
=20
@@ -1272,10 +1272,10 @@ overview of their function and contents.
       The list of source files - local or remote. This variable tells
       BitBake which bits to pull for the build and how to pull them. For
       example, if the recipe or append file needs to fetch a single tarbal=
l
-      from the Internet, the recipe or append file uses a ``SRC_URI`` entr=
y
+      from the Internet, the recipe or append file uses a :term:`SRC_URI` =
entry
       that specifies that tarball. On the other hand, if the recipe or
       append file needs to fetch a tarball and include a custom file, the
-      recipe or append file needs an ``SRC_URI`` variable that specifies
+      recipe or append file needs an :term:`SRC_URI` variable that specifi=
es
       all those sources.
=20
       The following list explains the available URI protocols:
@@ -1328,8 +1328,8 @@ overview of their function and contents.
          subdirectory within the archive.
=20
       -  ``name`` : Specifies a name to be used for association with
-         ``SRC_URI`` checksums when you have more than one file specified
-         in ``SRC_URI``.
+         :term:`SRC_URI` checksums when you have more than one file specif=
ied
+         in :term:`SRC_URI`.
=20
       -  ``downloadfilename`` : Specifies the filename used when storing
          the downloaded file.
@@ -1344,7 +1344,7 @@ overview of their function and contents.
       variable applies only when using Subversion, Git, Mercurial and
       Bazaar. If you want to build a fixed revision and you want to avoid
       performing a query on the remote repository every time BitBake parse=
s
-      your recipe, you should specify a ``SRCREV`` that is a full revision
+      your recipe, you should specify a :term:`SRCREV` that is a full revi=
sion
       identifier and not just a tag.
=20
    :term:`SRCREV_FORMAT`
@@ -1353,10 +1353,10 @@ overview of their function and contents.
       :term:`SRC_URI`.
=20
       The system needs help constructing these values under these
-      circumstances. Each component in the ``SRC_URI`` is assigned a name
-      and these are referenced in the ``SRCREV_FORMAT`` variable. Consider
+      circumstances. Each component in the :term:`SRC_URI` is assigned a n=
ame
+      and these are referenced in the :term:`SRCREV_FORMAT` variable. Cons=
ider
       an example with URLs named "machine" and "meta". In this case,
-      ``SRCREV_FORMAT`` could look like "machine_meta" and those names
+      :term:`SRCREV_FORMAT` could look like "machine_meta" and those names
       would have the SCM versions substituted into each position. Only one
       ``AUTOINC`` placeholder is added and if needed. And, this placeholde=
r
       is placed at the start of the returned string.
@@ -1368,7 +1368,7 @@ overview of their function and contents.
=20
    :term:`STAMPCLEAN`
       Specifies the base path used to create recipe stamp files. Unlike th=
e
-      :term:`STAMP` variable, ``STAMPCLEAN`` can contain
+      :term:`STAMP` variable, :term:`STAMPCLEAN` can contain
       wildcards to match the range of files a clean operation should
       remove. BitBake uses a clean operation to remove any other stamps it
       should be removing when creating a new stamp.
--=20
2.31.1

