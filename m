Return-Path: <gsimoni@infinera.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67490C433F5
	for <webhook@archiver.kernel.org>; Wed,  1 Dec 2021 14:11:46 +0000 (UTC)
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (NAM04-MW2-obe.outbound.protection.outlook.com [40.107.101.78])
 by mx.groups.io with SMTP id smtpd.web11.91932.1638367903465934675
 for <docs@lists.yoctoproject.org>;
 Wed, 01 Dec 2021 06:11:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@infinera.com header.s=selector2 header.b=T7g36Fzo;
 spf=pass (domain: infinera.com, ip: 40.107.101.78,
 mailfrom: gsimoni@infinera.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GOIYSTvB4rNzVqW0t/xZID6VRVv/5IG9xC/5OIXK8mQiDM/oBZFpJk7oJxiyaKV0TFd7aT5URVFnvui3Z8yGJKzoPNCN9MU8aWkrWuvPbMwttz8rrZuZKw39CJEcmQEblku+PL7dZ01z4ExkeSIrHAK1z9kZB3N/uCymhkSG91o70UOH6T1cS+LT7SKI2hH4OrgNhsQfVecCzMtKyGUwEZiIVM5E7g4vIgx06GqiUqVgDuWLZKHYdG3VpmIPAkkIHvaDbKsu9rT6d4r8nODHxJEW9qoEWpiy9PXUIx9Upfl5MQOS5Wjr9MWMlyl5H/E9ttwCR+D5ltaUHIUVcYNlxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kqf1peXM7BWHhUUJsgtBv4tFsPuq+KlzUK0r+W+gxvw=;
 b=GTymZrJvunmzXsU7vP4JXW3xFia6K6A8osva++c3CEhHx3wNytGk1md20XHdT6E9wg85TMK43M1u20LUSplQsQhMCZpdIgyJcIqrAacOeBkcX8qI4Y2Hz+ggmYi/EHg/iRQQScg+UIpFKHVrVjZuEhyoe+AXl7IpYKbw0SCte/pUp/5+CoaRw7ogRPTL7vcVvp74kEe0cZORmGkEMYlDQplTUZLBYl2zSHUYvZO704Lb8WLPLD0iQeTD0sIUUL4SK0xOrRuowL9PNpgsR/wpG3bZnNgOyH94F4MkbV6GsiLgTgr57dWZZOoGOVSz9Va+2FtBCpPU3lVseVGdeRG1WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.4.225.30) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=infinera.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=infinera.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kqf1peXM7BWHhUUJsgtBv4tFsPuq+KlzUK0r+W+gxvw=;
 b=T7g36FzohBFt/dOTQgTWZQv+J1aYT5SJw2qhWO4fsC/tTcsAGInU1PaMOSTsIfWPZ2aqzMxS6nOSf22VaO6iWI/8ntm6/LSlUyIyLC+xhwi4kxRwJVw0GNMWbn8Xldbbo2r2xx+M2MzXGwKYKc/RtrmQAWM0m18jtlegA0TSTD8=
Received: from DM6PR06CA0043.namprd06.prod.outlook.com (2603:10b6:5:54::20) by
 SJ0PR10MB4734.namprd10.prod.outlook.com (2603:10b6:a03:2d2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Wed, 1 Dec
 2021 14:11:42 +0000
Received: from DM6NAM11FT033.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:54:cafe::24) by DM6PR06CA0043.outlook.office365.com
 (2603:10b6:5:54::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22 via Frontend
 Transport; Wed, 1 Dec 2021 14:11:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.4.225.30)
 smtp.mailfrom=infinera.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=infinera.com;
Received-SPF: Pass (protection.outlook.com: domain of infinera.com designates
 8.4.225.30 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.4.225.30; helo=owa.infinera.com;
Received: from owa.infinera.com (8.4.225.30) by
 DM6NAM11FT033.mail.protection.outlook.com (10.13.172.221) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4755.13 via Frontend Transport; Wed, 1 Dec 2021 14:11:42 +0000
Received: from sv-ex16-prd.infinera.com (10.100.96.229) by
 sv-ex16-prd.infinera.com (10.100.96.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 1 Dec 2021 06:11:41 -0800
Received: from sv-smtp-prod2.infinera.com (10.100.98.82) by
 sv-ex16-prd.infinera.com (10.100.96.229) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 1 Dec 2021 06:11:41 -0800
Received: from se-metroit-prd1.infinera.com ([10.210.32.58]) by
 sv-smtp-prod2.infinera.com with Microsoft SMTPSVC(7.5.7601.17514);
	 Wed, 1 Dec 2021 06:11:41 -0800
Received: from se-gsimoni-lx.infinera.com (unknown [10.210.44.39])
	by se-metroit-prd1.infinera.com (Postfix) with SMTP id 9DE402C06D80
	for <docs@lists.yoctoproject.org>; Wed,  1 Dec 2021 15:11:40 +0100 (CET)
Received: by se-gsimoni-lx.infinera.com (Postfix, from userid 160824)
	id 469D941C286D; Wed,  1 Dec 2021 15:11:40 +0100 (CET)
To: <docs@lists.yoctoproject.org>
Subject: bitbake-layers create-layer could be mentioned in common-tasks.html
X-Mailer: mail (GNU Mailutils 3.12)
Message-ID: <20211201141140.469D941C286D@se-gsimoni-lx.infinera.com>
Date: Wed, 1 Dec 2021 15:11:40 +0100
From: Giovanni Simoni <gsimoni@infinera.com>
X-OriginalArrivalTime: 01 Dec 2021 14:11:41.0332 (UTC)
 FILETIME=[5CF27540:01D7E6BD]
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fde43eb4-70d8-4326-4b35-08d9b4d47ff1
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4734:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR10MB4734ACB14079584CE595F2A8DD689@SJ0PR10MB4734.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	juAUZzdJ1uU6UcbcBqKdmUagXAl+2M9HqSg/ChMQIenX3x4uMklz0cIySakIYKC99aNIiURjntGmmxb0RNZMG7PhbK9n18cpLkvJJIUz6H2TIxFeM87eR4kW6d5CQPxtLDAsouQ3hu7PXRUul6KhiYgGkoJAlGUDMr5Gt4L6CJ7v+KASYcJcQnCv/glgTfFQ1VJQgZs9r1zH/7j4v9nWZQlafF1fS6GuqBeQ2AmGJEWz+/5BsbuG/Sfl+DZwvE1Ql2fm6F183E4rRzE621SLbKbFoLOFwlS0JXxnoQm2UTgrRhCKr+8dH9GBEVYRcbTsy6ARxxOCJh/6D2ad8fOj+xQQyQGJvnAbB6AmCZpP5YQ0rMu+Sud0Ako0MaUsbwoH0qaBin/R9yBOYAXRs/E2zPpVAZS3488LqIY7oaJ3hZ7KJ3xGFVMsWLbV244dnAfTOZJQN8FM3ndY9zditqVKNaOvjUj0b7JKWiohQoJPREtnXYD4mC+x2spHj+lFcfgR3TrulSZ4dPT5mgLDXIwJcuFst/G+VX7AZYm3fkerXtuD55pPjPpooVa11RuBJi0ZqUbDy/DcJ1MjfkeWc2zHwzmjC6Ij/gox5V5pDvlDwGcPaWiNEL6GUZuZUBcRlPFjpNqADJQ8NmUQ861IPjpGtQGOSlNV9ZziFPxMAsNMyqWazA+BgIs3776pI0je9d9/xbXLavLEVRy9DEyIc8nKTTNoPHyJwxjC7HsGU4Xiw09OYSjYgFvembavl6/2vHeAViX/ctoVoxffXoZosi/e2d1T4VV3Kxg4cRmS0EKH0ckohGagc1BWM93AqpdUkQ5Xc08z3F+U1raBGbNx3pMLMMj5oGCnhDxt7mOwM+cr+pBF44bR0yk4iZEydrJP7Beb
X-Forefront-Antispam-Report: 
	CIP:8.4.225.30;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:owa.infinera.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(40470700001)(26005)(81166007)(1076003)(6916009)(336012)(966005)(5660300002)(47076005)(2906002)(36860700001)(42186006)(8936002)(356005)(316002)(82310400004)(426003)(186003)(33656002)(8676002)(6266002)(86362001)(508600001)(70206006)(70586007)(4744005)(40460700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2021 14:11:42.1284
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 fde43eb4-70d8-4326-4b35-08d9b4d47ff1
X-MS-Exchange-CrossTenant-Id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=285643de-5f5b-4b03-a153-0ae2dc8aaf77;Ip=[8.4.225.30];Helo=[owa.infinera.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DM6NAM11FT033.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4734
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 01 Dec 2021 14:11:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2211

Hello,


I'm experimenting with yocto, and I found that a layer can be created
with `bitbake-layers create-layer`.

I would suggest that this information is be mentioned in the
common-tasks.html page, paragraph 3.1.1 ("Creating Your Own Layer")
[3], point 3 ("Create a Layer Configuration File").

The current documentation suggests to grab and modify the
conf/layer.conf from an existing layer.  As a newbie, I would prefer
to know the existence of the bitbake-layers tool, and to use the
layer.conf generated by it, rather than copying from an arbitray one.


Cheers
/ Giovanni


[1]: http://docs.yoctoproject.org/dev-manual/common-tasks.html#creating-your-own-layer

