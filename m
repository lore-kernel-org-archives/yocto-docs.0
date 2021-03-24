Received: from EUR03-VE1-obe.outbound.protection.outlook.com (EUR03-VE1-obe.outbound.protection.outlook.com [40.107.5.72])
 by mx.groups.io with SMTP id smtpd.web08.1911.1616565134667088230
 for <docs@lists.yoctoproject.org>;
 Tue, 23 Mar 2021 22:52:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=rdNwZ4T1;
 spf=pass (domain: pelion.com, ip: 40.107.5.72, mailfrom: janne.kiiskila@pelion.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UcX4bujhwjZBDodzZUG6JELoHy1lmDieJsVYKQ/kmDg=;
 b=rdNwZ4T1gLpDu3dmkAy8nX+m70XgJTBCQlIhzpeLpydn0uy9k81wEAoB4sBJzpew/eIkDEH3/+gTkq9zF2vxdgvvQTTkZdwcr4IaU9sA88L2GaV+xwavMEKDnLmzj7t+9xBfwfzFdMvWPKzTJoNKAN5A9LE5updlv1+OTgFbYwE=
Received: from AM0PR04CA0058.eurprd04.prod.outlook.com (2603:10a6:208:1::35)
 by VI1PR08MB3085.eurprd08.prod.outlook.com (2603:10a6:803:47::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Wed, 24 Mar
 2021 05:52:10 +0000
Received: from AM5EUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:1:cafe::22) by AM0PR04CA0058.outlook.office365.com
 (2603:10a6:208:1::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25 via Frontend
 Transport; Wed, 24 Mar 2021 05:52:10 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 63.35.35.123)
 smtp.mailfrom=pelion.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=none
 action=none header.from=pelion.com;
Received-SPF: Fail (protection.outlook.com: domain of pelion.com does not
 designate 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT057.mail.protection.outlook.com (10.152.17.44) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.25 via Frontend Transport; Wed, 24 Mar 2021 05:52:09 +0000
Received: ("Tessian outbound 7d88ebbbfeee:v89"); Wed, 24 Mar 2021 05:52:09 +0000
X-CR-MTA-TID: 64aa7808
Received: from 4d59992e02b0.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id A2CEAD4C-BCA3-472A-BD0E-DB839E015095.1;
	Wed, 24 Mar 2021 05:52:03 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4d59992e02b0.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 24 Mar 2021 05:52:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZdBcbATPMgJyER2jdFumRDD7KS80Lbags5ZHhmTVQtCnQbnPoS8GLXQi+EaMC1gjEb8Oov0KHObxwHHYKgqfaSQes8Z4oFSvqxPM5zMbkWKV3De/X7pGvkcR9XVVzbxW3Xs7QWHEdTjrYKo9J8dfZ33M036yWMGW0mgSX2e4ybAqKJYQtAh1L4/68+8fsrUhDAJGiCdxT/XA6RTMCnkQwW+fIIkC52rlxwI0IphYDwNzfND8b3522jCo/DWLEYBrXQHgFZ8XJgCEFyE/6FwFlHicpAyTr6fRgok3yUFP7yboLflXcFXK+ckfvLoWp4fOnfWGuMYGOUhmVPR+ybTJmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UcX4bujhwjZBDodzZUG6JELoHy1lmDieJsVYKQ/kmDg=;
 b=dBy8RRQ1wQepwFNJCBofx3a4AGQnc6CtC0bfMD1I2j/c0Wwd+BvQ++Qe6U1FfgNqqMXcXUy2lMXjf24WpRXOt8r589I/1GKSfN3I4FoifJL1Rts0sAIawwpzhlql6NgAXqFfLK21dGmvUX4U1GQw/GmOsLRGjaKzfHgtkWU4v3HdcumK71nFP9ircqzgA/M/K2QG2WAL53WjDlEPedMlD1AbOSx3YK2c5Egr6bKXAmCJ1gkJ01udOP+hN9DeayQFVCPHQdyZv1RYKpwrOfQwLMILAa6p+f29hMfyN57S+IoSBAbOSZU1cXOvKQR/7t1CormX+Iw9aoqAL3++R1PPUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=pelion.com; dmarc=pass action=none header.from=pelion.com;
 dkim=pass header.d=pelion.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UcX4bujhwjZBDodzZUG6JELoHy1lmDieJsVYKQ/kmDg=;
 b=rdNwZ4T1gLpDu3dmkAy8nX+m70XgJTBCQlIhzpeLpydn0uy9k81wEAoB4sBJzpew/eIkDEH3/+gTkq9zF2vxdgvvQTTkZdwcr4IaU9sA88L2GaV+xwavMEKDnLmzj7t+9xBfwfzFdMvWPKzTJoNKAN5A9LE5updlv1+OTgFbYwE=
Received: from DBAPR08MB5558.eurprd08.prod.outlook.com (2603:10a6:10:1b3::19)
 by DB8PR08MB4138.eurprd08.prod.outlook.com (2603:10a6:10:a4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Wed, 24 Mar
 2021 05:51:56 +0000
Received: from DBAPR08MB5558.eurprd08.prod.outlook.com
 ([fe80::380f:e6cd:ff32:f81d]) by DBAPR08MB5558.eurprd08.prod.outlook.com
 ([fe80::380f:e6cd:ff32:f81d%7]) with mapi id 15.20.3955.027; Wed, 24 Mar 2021
 05:51:56 +0000
From: janne.kiiskila@pelion.com
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
CC: "docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] UBUNTU sudo apt git instead of git-core
Thread-Topic: [docs] [PATCH] UBUNTU sudo apt git instead of git-core
Thread-Index: AQHXIBBlcs5H5MEKBkq1DO1oKt8zC6qR4z+AgAC/w4A=
Date: Wed, 24 Mar 2021 05:51:56 +0000
Message-ID: 
 <DBAPR08MB5558BFAE9CD6AACFAF72D7B5F3639@DBAPR08MB5558.eurprd08.prod.outlook.com>
References: <KkZH.1616523262298523931.IGi7@lists.yoctoproject.org>
 <20210323182357.i4sm2b3ggj3i7cjq@qschulz>
In-Reply-To: <20210323182357.i4sm2b3ggj3i7cjq@qschulz>
Accept-Language: fi-FI, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: BDE9690C285069448D3B7DD1AAAACC71.0
x-checkrecipientchecked: true
Authentication-Results-Original: streamunlimited.com; dkim=none (message not
 signed) header.d=none;streamunlimited.com; dmarc=none action=none
 header.from=pelion.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f1772548-5322-4e2d-82f8-08d8ee88f6ed
x-ms-traffictypediagnostic: DB8PR08MB4138:|VI1PR08MB3085:
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB3085ADA6682B1E98F51E01EEF3639@VI1PR08MB3085.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:6790;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 rgzwHsowZRO3vRdikIRdMf0NfOGxePAxNTudszN4JoG1XUlfkjttTCbH8n1l5ziFHyQq9kuTmrpjLSo0mzWG1clB6XsYRDWq64UROJVhJI84ALDaZF1PqmI8syhZh1vqY1DsdN+EBU/wcyOarRm4zfPraglmsLYOPMTXLL7Ziixcc2GeR/bTiWV917pRJoydranmX8qBxcWMaAPXfB/en1Fzx1lRK4lpfj6d2kP+3KqenbKOkKzPSBdD2QiTqRHKbL0dYuqS/5SvL1f1uXX+D7Huz+FEiQxjGjh7hm92+Dy0zbxwUPnAxY9BpLlE+fsJehV+zkhcl7Voq3LnUe5AnDAzSNtzKkoLRDJGSocrLKZXJky4KVeajR5vz40C3STuK0ULFQOv8XCgu4jCRH8lMkgFAN2E2AHVANqy+eAIFONtPpteub6JHYGplfDGEZ6rhFELlDq9mE7Y9hlfTNxy4c12tMY3x+3F1KIg9FfsFD5NrZ4IFQ4iEdZ9ItxPWJxNPzdgcTWpaHMTNmPZm4dpf9fuiWGDR7U5RRmW9z+S1/xH4GJCnJP7wFzsLepEBr3Lagq/xhYwIPl/sBea7WYIu4PHW7XBaAuGxpxAAcnRKVK7P4iWJr3iuOCzlfEZ0fZmcqxyxFhYEK8HhP9/MqTPcDUuOTr0Nch/LDfZunw2KbaPsW2YSO7my37tzFQOjKuBHrPxVBLp//LJg4H7t7Zs+khBsEZWwYWqqRZvVre6QyX9S/gs9/d1WtmsgKxENzFw
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5558.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(39860400002)(366004)(346002)(376002)(316002)(4326008)(26005)(8676002)(7696005)(186003)(33656002)(8936002)(53546011)(38100700001)(86362001)(55016002)(66556008)(66476007)(66446008)(71200400001)(64756008)(52536014)(83380400001)(6916009)(76116006)(66946007)(2906002)(5660300002)(9686003)(6506007)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?us-ascii?Q?BEKaUropODl48hOmNXkpZ4aZwJIUyqJSGt6t2gQfF50KLAanyjULP+j19pOi?=
 =?us-ascii?Q?zCUzQ7idvUF3WhbiEc4puwGn3QnMCsUAVEqU8UqcjL/HoP9zL0dqbapzelvd?=
 =?us-ascii?Q?12sxqUIpxq5nU6Qfhn1i6bGmttZhBLZN6GkiMVzGj5n+HdL6x86PHJigCBbs?=
 =?us-ascii?Q?2NBEhE/e5AXMDdLGArqRa/vFL2zqV+FjevFdERxwu5SJPeSLh1QPbHOXRCpo?=
 =?us-ascii?Q?4B30s77poAtXOSS6tqbX5PMqCINTZ1mSBMyw42P7GFBlZbqmMxzuS9aA8Yzt?=
 =?us-ascii?Q?Medn22J10AniT8KyNyvfLFcDanR7RIWspRLIqC4/4zUFrX9TcHOQEoE2kDVj?=
 =?us-ascii?Q?UK9MCugcwkbu2ON2vLMlZ8Wm4iM56aPXmOftiUeV0fO8jrEikvltAvhtgJgA?=
 =?us-ascii?Q?zm9kD6wW2gjHV2EK8k/1sDypwj4SrM7KCJPfWpWx58qNHkv3CBtHtaIjxwbL?=
 =?us-ascii?Q?bWOhl7QbxMBru3LOc0ZVhqvwRSisXeF8sb1ctOxOe5ajSB5HaLW8mSK99lua?=
 =?us-ascii?Q?GgGGmZUJkMBkV0G0RSpX9T/CEr5XAZin13/vB/MdoY6C+6RAEgIzCjWWj+mQ?=
 =?us-ascii?Q?jEz4LqtvVeV8lGOr5+dUvepiLA0pGdKCvASHvMpXcYAcgIlwbWpOqCo/Y995?=
 =?us-ascii?Q?w/G5t4US3H3FusIC73BMtzCZqnMbc4yxS71Yzw/peObprgh+W8UbP2dEydDb?=
 =?us-ascii?Q?jfE6xONPmPzbgMTQ8Su7u5oTZWqZ3xStRzNAi1MzLfSjYwr9vdfH8xmuLDhP?=
 =?us-ascii?Q?bQyksRW0vy91jq0NEvxBOt2qIMQM7VA0JoCsW/pNdJc+GTNNDSvS2EDOsBwy?=
 =?us-ascii?Q?48i7CmdHDLRFG8bXd0ucAXyBSrFWjJBlVjlUY0Kokswk1vjtDiAfUQJfI35w?=
 =?us-ascii?Q?fyqupYU4/4GFEYjXP7c+pV1p5KoYc8Ep8v/Liqd9MoS64sAjI+9mOB6lCsfq?=
 =?us-ascii?Q?RGVHa8Z5b5yI0jO72Enj2IS9U7paF3dOxuT2+x5gRwC6M9F/2TzEBf4/fNkc?=
 =?us-ascii?Q?wU3dDL3WqQ5K7dnmkQZzBTpgK1SAaseJuxDHQd9TyJIOllt4Ph0h2vLGcJxi?=
 =?us-ascii?Q?BFRVDwVNPg91Y5CxKmjb++d8I4hJYe+PBtxZ2rjzL+jHreID2VlatpqwJnq/?=
 =?us-ascii?Q?IMmlDzf0Bbwd1bFH3yXKRock4S3fx+QR84k7cXtCnq17FIx16NBxd/Ur01fn?=
 =?us-ascii?Q?YUVAppB+fs6vGy0eVRJkN0LT5F7TgnL52WErms3iyf3wrXbsITymjfqOCcmh?=
 =?us-ascii?Q?aLBBHzpoRSWGsox3z53a8EuyXxgBt4v8tuoXy8D+ay54l249eR1mKkYxeilg?=
 =?us-ascii?Q?PyGR3Dm2vqsGuS50S3Vx/lA2?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4138
Original-Authentication-Results: streamunlimited.com; dkim=none (message not signed)
 header.d=none;streamunlimited.com; dmarc=none action=none
 header.from=pelion.com;
Return-Path: Janne.Kiiskila@pelion.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	e0d35c03-1952-4be8-8367-08d8ee88ef20
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BspoWoYBAbeaw0R/osErWmFHHCS53Tu6HOvmTu2f7cQm0oOHzCaoTX7IE5+7n3XegVQr0A+1WRJfiIBhWgk14cQrAsZtbz90RrlvTaehb+Oc8ug8V5QcX/lM7y1us5q3KStw5VpKpX5yNK0u2CWpCpK52JmoKthncynvr53xbtC+nfRwZg2N202DMXyCoJyLXRNT4KYwGICC2YrlRrqt6hNGGJNw1hkKby+9aLmelMsxNTV8lZAqeQ/9V2eQ9FPe0glKtAa9Eoy+WBXnzNXt+nzrmA5/YCj+m63IAo3k2Fh7JZDR+3zXqYe/tGQDEZjyYJQ8UgNtF9LTDaqpBAYgWQrPbQY6sVKF49NW5oZDrMaPz7votgYdx9ETBC3li7RBi64q9ad2tpITdwURyaYhAmVpbK4fgmCWr0n/YrN2G38QJ2zfpggiz4X0x6ZWnpoFr9T0ayq43XTYPQ/hcja/DrSlwjeDit0l6y1hbJDDsv7IqYD2wlfyOUpW6oAvQ7d7PXWFpusY2OO+Wbb3GclZi1o7nzwiqbN/SvMiFBmIkJOjaGO6fS50y1CSY5h1bNdl3rpDM5n88NHkWSFB85OK0Bt3IOJh6jeHCVuuVqQieKVt5MPiqyCZHG82e/dGTuODvs0BEGVUeVVMM8cZw+XBQmR/uOWVgZ28/demEJvqdkEnndvmZc2Au3dFIoERpRz+FRhM4rZLWiabTwc/yZGrAds93MjrpM+PcrXyczIkJME=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(136003)(396003)(376002)(346002)(36840700001)(46966006)(52536014)(70206006)(6862004)(478600001)(316002)(336012)(356005)(5660300002)(2906002)(33656002)(4326008)(186003)(26005)(70586007)(6506007)(83380400001)(86362001)(82740400003)(55016002)(36860700001)(47076005)(7696005)(82310400003)(81166007)(8936002)(53546011)(8676002)(9686003);DIR:OUT;SFP:1101;
X-OriginatorOrg: pelion.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2021 05:52:09.8069
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f1772548-5322-4e2d-82f8-08d8ee88f6ed
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3085
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hei,

Updated patch provided with sign-off and a test script which confirms sudo =
apt-get install git works on mentioned distributions.

From b43f224c44e18c1ee41e0170c4289bada8844559 Mon Sep 17 00:00:00 2001
From: Janne Kiiskila <janne.kiiskila@arm.com>
Date: Tue, 23 Mar 2021 11:11:39 -0700
Subject: [PATCH] UBUNTU sudo apt git instead of git-core

Ubuntu has changed packing and git-core is not available anymore,
it is now just plain git.

(pelion-venv) jankii01@ubuntu1804:~/poky/documentation$ sudo apt-get instal=
l git-core
[sudo] password for jankii01:
Reading package lists... Done
Building dependency tree
Reading state information... Done
Note, selecting 'git' instead of 'git-core'
git is already the newest version (1:2.17.1-1ubuntu0.8).
The following package was automatically installed and is no longer required=
:
  linux-hwe-5.4-headers-5.4.0-65
Use 'sudo apt autoremove' to remove it.
0 upgraded, 0 newly installed, 0 to remove and 13 not upgraded.

Documentation should match the current package name to avoid confusion/warn=
ings.

Change can be verified by running the following script

set -ex

distros=3D("debian:8" "debian:9" "debian:10" "ubuntu:16.04" "ubuntu:18.04" =
"ubuntu:20.04")
for i in "${distros[@]}"
do
   folder=3D"${i/:/.}"      # change : to .
   mkdir -p $folder
   cd $folder
   echo FROM $i > Dockerfile
   echo RUN apt-get update \&\& apt-get install -y git >> Dockerfile
   cat Dockerfile
   docker build -t test-$folder .
   cd ..
   rm $folder/Dockerfile
   rmdir $folder
done

Signed-off-by: Janne Kiiskila <janne.kiiskila@pelion.com>
---
 documentation/poky.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/poky.yaml b/documentation/poky.yaml
index 3c30c4430e..2554f1e496 100644
--- a/documentation/poky.yaml
+++ b/documentation/poky.yaml
@@ -11,7 +11,7 @@ YOCTO_POKY : "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;"
 YOCTO_DL_URL : "https://downloads.yoctoproject.org"
 YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"
 YOCTO_RELEASE_DL_URL : "&YOCTO_DL_URL;/releases/yocto/yocto-&DISTRO;"
-UBUNTU_HOST_PACKAGES_ESSENTIAL : "gawk wget git-core diffstat unzip texinf=
o gcc-multilib \
+UBUNTU_HOST_PACKAGES_ESSENTIAL : "gawk wget git diffstat unzip texinfo gcc=
-multilib \
      build-essential chrpath socat cpio python3 python3-pip python3-pexpec=
t \
      xz-utils debianutils iputils-ping python3-git python3-jinja2 libegl1-=
mesa libsdl1.2-dev \
      pylint3 xterm python3-subunit mesa-common-dev"
--
2.17.1
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
