Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 310A7C6FD1D
	for <webhook@archiver.kernel.org>; Tue, 21 Mar 2023 20:43:39 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.72])
 by mx.groups.io with SMTP id smtpd.web11.25714.1679431413532698132
 for <docs@lists.yoctoproject.org>;
 Tue, 21 Mar 2023 13:43:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Z7u9Hdpw;
 spf=pass (domain: arm.com, ip: 40.107.15.72, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZpCnxat6t7pqAgB7CitGUcKf9SZclgmUn7Y0Uv+ReVM=;
 b=Z7u9Hdpw3k7cjAd3gA6ZVOWKBdn1A3TGJIX3UyV4Mv+Lr2jOnGD4Ui+QnYSV1jNPDfl6uVjz5x8fHHth1yitB2YcrFADnhnMIjVZxOqGIGxcy46XzBMAe/Ix+PsXyYXWlw4FjS2hcNJvxz0ul4VDQIaqnJCXuK/Zb+HWGSFJyzs=
Received: from AS9PR05CA0193.eurprd05.prod.outlook.com (2603:10a6:20b:495::15)
 by DB9PR08MB7582.eurprd08.prod.outlook.com (2603:10a6:10:306::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 20:43:24 +0000
Received: from AM7EUR03FT042.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:495:cafe::5e) by AS9PR05CA0193.outlook.office365.com
 (2603:10a6:20b:495::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37 via Frontend
 Transport; Tue, 21 Mar 2023 20:43:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT042.mail.protection.outlook.com (100.127.140.209) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6222.17 via Frontend Transport; Tue, 21 Mar 2023 20:43:23 +0000
Received: ("Tessian outbound b29c0599cbc9:v135"); Tue, 21 Mar 2023 20:43:23 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b24b2da70fef2ce2
X-CR-MTA-TID: 64aa7808
Received: from a9653e9458cf.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 06E0D316-7BE6-435F-8BFE-1A0FC4F23106.1;
	Tue, 21 Mar 2023 20:43:17 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a9653e9458cf.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 21 Mar 2023 20:43:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UaYB/x5dw9FVDOv0raIZL5PTTwe/Ue8fi+rpLGV+KEmkmuB/6d0Enk0tmZXKs+gzhEzBTzsNccC9ebYWhXR0jQWtoiIj+BsQo9tFDaqvoYGdwC0x2tLmikYHpa82SVPEYrJWFCS/qFlknp78HWMvEYRZ4HuocMcdk5NSiV6wr9VV2HdO9cvRkRz18T5ebB4evyl4eNDIh8P/3vTGUb8r/hbEXqNKcxI+f5Tz1MXg39gwIO1zrzmr/nuWABED4FjbTNs+PQk6RQVvldljZlObiNUdOW5IIB4cH7KXhPXolAjtX9cctbRro9Si9YBeIm94aOUD6SlAVe2bkcpShK3U5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZpCnxat6t7pqAgB7CitGUcKf9SZclgmUn7Y0Uv+ReVM=;
 b=ctvqQYki1AcNneVPrTGgPOUJ+tdwhgSRIXpHX3zvC5h61By4tcy5OGYCiJoteXwP9F/UurykFWwwt48pHPU9T00T+x0dDDR5RbDgV4oYSqosw2G7nKu3+Toe2Lk0iKPzO5YRBuPccaUzLq7dDjpzQddFuLEhD0CbvVS3vigTQarg8OCH2LhLPrY+d7LLzMPMYgFie27LpvyOYBd3zjKBsJxAaYXeJFA7cUd3R5JgkeatOdEzBkMDl8yDCDHVAScnlwhNyl3ghxPo9L0M+NywpJ+uRkO0G+tJT/uT6+Ss6YPRm5iYPPhS2sWjl0SgKV/NEOBIaqCkejHaMxkDXpwnFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZpCnxat6t7pqAgB7CitGUcKf9SZclgmUn7Y0Uv+ReVM=;
 b=Z7u9Hdpw3k7cjAd3gA6ZVOWKBdn1A3TGJIX3UyV4Mv+Lr2jOnGD4Ui+QnYSV1jNPDfl6uVjz5x8fHHth1yitB2YcrFADnhnMIjVZxOqGIGxcy46XzBMAe/Ix+PsXyYXWlw4FjS2hcNJvxz0ul4VDQIaqnJCXuK/Zb+HWGSFJyzs=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAWPR08MB10041.eurprd08.prod.outlook.com (2603:10a6:102:34f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 20:43:15 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::e305:742e:e10b:1093]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::e305:742e:e10b:1093%2]) with mapi id 15.20.6178.024; Tue, 21 Mar 2023
 20:43:15 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
CC: "docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] ref-manual: release-process.rst: update testing
 section
Thread-Topic: [docs] [PATCH] ref-manual: release-process.rst: update testing
 section
Thread-Index: AQHZXDVo0C+4ihwuJ0C/nPphUMVIca8Fsw0A
Date: Tue, 21 Mar 2023 20:43:15 +0000
Message-ID: <F93D5EC7-ED2A-418C-9E48-77495A1A55F9@arm.com>
References: <174E89BB108C99F8.22739@lists.yoctoproject.org>
 <05c3128f-4d06-bd95-3dba-a15eba48270e@bootlin.com>
In-Reply-To: <05c3128f-4d06-bd95-3dba-a15eba48270e@bootlin.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAWPR08MB10041:EE_|AM7EUR03FT042:EE_|DB9PR08MB7582:EE_
X-MS-Office365-Filtering-Correlation-Id: dd7a708f-f176-4427-535e-08db2a4cea26
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 GpwapsJnBllGNiApJc7mfR3NXiYBrm6u+aT1DjVi3WAT9gCbl540Rv2MaY8NGQ0y8oB3OnTGbGxxcw9mWPumeu1QyvwY+TVmQOp0auUXVuajzWqH6rzHLkRoLwqM3FStrUDVowtoHuqULv3yR6Z7fLsn4/t1XGzN63qLM9oGnWQgER5sElOjHn/IgUIkXrjG2NEQln56vHD4iU8DE5cUwYPqKLyqlW2iA1RSe8J7pAmLDHMqXB7V4Ia3pBxfZz3+ACoXtzWiangtwesdn/5ux3OttcrHVLZ5W7zhbpC+FCx1dMhHP2LI6OvzkKR4jr4AdngmnEpY/9vUZyPkFdIrfjB5h1HC4yJNoyg+vJXLR3xtOkmoBqX95tSwjlIpY4FjmKkDDdrkvjX6NBo3jM6EIKHHouC6aszfGol1PX0B9K6uc5G7PrUWP1UGCIH25RFk3LB8OsCi+fekQ4kpr6cfFcNtt74dyXeQo5qI3xl3QPxytb2lB8bo0QRTTMXxfrvh0cPvR8WgeH5mWLaNJ92Jd9wqt0wIBK+R6Xi3LwvL/H3kZwmmTO4U16c3s2vCGaxn3Ml4FqTimN6fP2fDKg+heV7gFOg5RUANn2WPBBYNdtjAsNw0Nq3D0ENlqB9CoVxEJ8SepnYabV9WYljir/tsdPuHPG26PB6YV1h4Bc0l+NyrMo5czDDKRWIf4jLztuqLYq2MKu+6qtp3rCdBf9ozPIMmSdo7MmUlN8QrErKT+9Q=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(366004)(376002)(346002)(136003)(396003)(451199018)(2616005)(6506007)(26005)(53546011)(6512007)(6486002)(316002)(4326008)(66476007)(66556008)(6916009)(8676002)(71200400001)(83380400001)(91956017)(186003)(478600001)(66946007)(76116006)(64756008)(4744005)(15650500001)(8936002)(5660300002)(122000001)(2906002)(41300700001)(66446008)(38070700005)(38100700002)(86362001)(36756003)(33656002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <10C05D735C559144BE526D8B313C22FC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10041
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	bd635627-82e6-4e32-5ce4-08db2a4ce505
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Mt+MtBFbBXYxu3rQnu8H6SafR2zSKi/urHtGBUvhgdbD618DKbm/2XWAkIff06Qw3/NWzCmsXYBAguMHcKff1Aw1NRcObhxj9gzcNDgegnzK4wOlW3GkmStuoO3rRqd76NH8jWGHBHArq5bHOXMazM0IDYjfhKGd17M4URrZ7E5i4UuZHE0OArED4z7OQae5E+zvyGkzSxA8JcTAmcmR1R5bywvgO4Ej/TqrY0jvUmtuDcDZrJBz6RQ3xItTApSMgDNPUWWoA4WnL96+qYYmiAWYCby2lbdaDhhRHVmW0+tI0/2djqGpFzZDlYhpN8HsdrwCjDaZFp8GuO7poLvOIwD4aOi6iBtmlMp7JNOA4TWshlZ/gmpk5OLitijJFcCo1AEF2s60aHA/00q3E/5UaBOEbAB7NY/RYlyudOcwj4AypFfSUF/BQA8Yc04Q8RF4MJiWszTQle50pXL3kftAANM9cOfeJ0nk05cB0989wYQWL1mYV0DhLX95KyVBt3ZL8itgH0Of8KU0lyGdZeeu5b04wBbubfz5D0fKZHpmy2XWpjrLRMOp22dQPA0/6LL9Sl7rK8fuh2H0jOiy1HsFbcb0XLQB/r5mU7zYCxf9vqDDQMTacb17NBTSounlVsPG0LaXE7JRhKwT18tUTaUb2yMTXSUGIgLDStOenxCnDzcYOoL8j5HJS8l5YGuphgcZ356AEKfV0nSHBJInrCreCg==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(376002)(396003)(346002)(136003)(451199018)(36840700001)(46966006)(40470700004)(6486002)(47076005)(2616005)(53546011)(33656002)(6506007)(5660300002)(70586007)(336012)(86362001)(26005)(478600001)(40460700003)(316002)(83380400001)(82310400005)(186003)(6512007)(36756003)(4326008)(41300700001)(8676002)(36860700001)(356005)(8936002)(70206006)(6862004)(4744005)(15650500001)(82740400003)(40480700001)(81166007)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 20:43:23.6693
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd7a708f-f176-4427-535e-08db2a4cea26
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7582
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 21 Mar 2023 20:43:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3813

T24gMjEgTWFyIDIwMjMsIGF0IDIwOjQwLCBNaWNoYWVsIE9wZGVuYWNrZXIgPG1pY2hhZWwub3Bk
ZW5hY2tlckBib290bGluLmNvbT4gd3JvdGU6DQo+IElzIHRoaXMgInJvc3MvbXV0IiBicmFuY2gg
aW4gcG9reS1jb250cmliIHN0aWxsIGFjdGl2ZWx5IHVzZWQ/IEknbSBub3Qgc3VyZSBmcm9tIHRo
ZSBsYXN0IGNvbW1pdCBkYXRlc+KApg0KDQpJdCBpcywgYnV0IEkgZG9u4oCZdCB0aGluayBpdCBz
aG91bGQgYmUgYW4gZXhhbXBsZSBvZiBzdGFnaW5nIGJyYW5jaGVzLiAgSeKAmWQgc2F5IGl0IHNo
b3VsZCBqdXN0IG1lbnRpb24gbWFzdGVyLW5leHQgaW4gcG9reSBhbmQgdGhhdOKAmXMgaXQuDQoN
ClJvc3MNCklNUE9SVEFOVCBOT1RJQ0U6IFRoZSBjb250ZW50cyBvZiB0aGlzIGVtYWlsIGFuZCBh
bnkgYXR0YWNobWVudHMgYXJlIGNvbmZpZGVudGlhbCBhbmQgbWF5IGFsc28gYmUgcHJpdmlsZWdl
ZC4gSWYgeW91IGFyZSBub3QgdGhlIGludGVuZGVkIHJlY2lwaWVudCwgcGxlYXNlIG5vdGlmeSB0
aGUgc2VuZGVyIGltbWVkaWF0ZWx5IGFuZCBkbyBub3QgZGlzY2xvc2UgdGhlIGNvbnRlbnRzIHRv
IGFueSBvdGhlciBwZXJzb24sIHVzZSBpdCBmb3IgYW55IHB1cnBvc2UsIG9yIHN0b3JlIG9yIGNv
cHkgdGhlIGluZm9ybWF0aW9uIGluIGFueSBtZWRpdW0uIFRoYW5rIHlvdS4NCg==

