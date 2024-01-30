Return-Path: <chris.laplante@agilent.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB35AC47DDF
	for <webhook@archiver.kernel.org>; Tue, 30 Jan 2024 21:04:48 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.40])
 by mx.groups.io with SMTP id smtpd.web11.8231.1706648687380015785
 for <docs@lists.yoctoproject.org>;
 Tue, 30 Jan 2024 13:04:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agilent.com header.s=selector1 header.b=LKMftsEo;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.236.40, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dQg/ox3e+SKA8VXwhAT28I4gYd3w9nuDaX3WpuvsZjsXhSbIxzFgBQ/ZIkzRC/ED3a4ZP/c/3l/oM0mo7/quvQqDvPqfJL8DMds83YW7vOzgUU6NsednbwbLi1iw7I96hD6CyEiCzeaO989nqX5SCZzxCRryMjF4DQUGLGsIItAb3Z9TeLfX1/w1jXeG8X/MyrhL4dL1wyZh/gWRUBvYCiMbwHxoxBRYM4PWkQhk1xzVsWhso8wode6lYDxpKtTzUje23vvQkoKSaDSslUPKlTeHeIAOat2zm9oVdbM1WxHULjQimuinnH633rHpcXX5U+ZRCdekndTJ491ZtrXl3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UwFa6wQJLwRtfOGtT58WDYvGiOcd8cVx5KnKSlsvzWs=;
 b=XI1CdKmh5GCPq1QbtbOJf2nBDAs5kMIPbEGcZk3prNVcAcD/6dKxMt9FXGIoLU05lejCXPOOvfOf08wDv+LSH2W6dfFwur8J242sedYFnypPa6tU7g/rhcvZl08KFfMJ4Y6eGpV/VJShMzWb7nhUB5H/3Arkub0mYcreW54DiqgqRGa2V1YIkpdpEezIoG7yeIWLIJ4Uhhz1oAI4SQXMgpWCgh3dQt1Eae4gXO2LD73TLxAto4KCJYfrscYzazsrJaBdQN74MlOhHmyX3YgqimOXGFRGN3Mojrv75rYZBVPqbWKu8YJYckc8V+HXLFQQGxjBC2BcTM3JZKEmrW+IAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=agilent.com; dmarc=pass action=none header.from=agilent.com;
 dkim=pass header.d=agilent.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UwFa6wQJLwRtfOGtT58WDYvGiOcd8cVx5KnKSlsvzWs=;
 b=LKMftsEo+nh1jx+DelIX8maBTgFygARKw2dsBlRK+kOP4JCRna+Jg/BV4PHYbwV+f17eQPEDKRgdpajQJ172v4TIH4WHex+9KLixr7LQa9FuPbpkig4P0MLoNIUSpWr0VTyoztagEZlWw533vdRRuWRALM9yMIUkZK+kFTje0nXM6iuSu5j7x69EUotSR+aVUPjmmHveNskajLh8sg0+qAnRVe9BiWT0O6QCZ/B7q8TaBSdmarhVFGS4yT4mpV2yONZWXy2XZQq6+GzayM6moimDF6c/eu7fPbAvqAuTrdRTc7sJTS9VUm3XPmGguzn4pWNdpH+QNldDnAM7PZmZaA==
Received: from DM8PR12MB5430.namprd12.prod.outlook.com (2603:10b6:8:28::6) by
 MW4PR12MB7117.namprd12.prod.outlook.com (2603:10b6:303:221::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.22; Tue, 30 Jan
 2024 21:04:43 +0000
Received: from DM8PR12MB5430.namprd12.prod.outlook.com
 ([fe80::a0e9:1e42:58af:ba95]) by DM8PR12MB5430.namprd12.prod.outlook.com
 ([fe80::a0e9:1e42:58af:ba95%6]) with mapi id 15.20.7228.029; Tue, 30 Jan 2024
 21:04:43 +0000
From: "chris.laplante@agilent.com" <chris.laplante@agilent.com>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>, Michael Halstead
	<mhalstead@linuxfoundation.org>
CC: "docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
Subject: RE: [docs] Possibility to use 'noindex' or rel="canonical" to stop
 Google from indexing old versions of documentation?
Thread-Topic: [docs] Possibility to use 'noindex' or rel="canonical" to stop
 Google from indexing old versions of documentation?
Thread-Index: AdpPsu7u9Jkwri9pR1eSUE2qWRGI6wAAqpUAAAAI9+ABAkBXtAAARkpA
Date: Tue, 30 Jan 2024 21:04:43 +0000
Message-ID: 
 <DM8PR12MB5430164F89E5CD002A55C5DF8B7D2@DM8PR12MB5430.namprd12.prod.outlook.com>
References: 
 <DM8PR12MB5430C1F3DF524811569BF9A08B7A2@DM8PR12MB5430.namprd12.prod.outlook.com>
 <df129fbff9b6a2c77be7354b302307e7b67ce806.camel@linuxfoundation.org>
 <DM8PR12MB5430B9DFA3D7B1DABD0C4EE28B7A2@DM8PR12MB5430.namprd12.prod.outlook.com>
 <17AEEAA999A6674A.16647@lists.yoctoproject.org>
 <6c7033a2-1215-49d2-8624-a79274953244@bootlin.com>
In-Reply-To: <6c7033a2-1215-49d2-8624-a79274953244@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_ActionId=ef939db9-2e52-4e57-bc3a-7f6e5e10a059;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_ContentBits=0;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Enabled=true;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Method=Standard;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Name=General;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_SetDate=2024-01-30T21:03:58Z;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_SiteId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=agilent.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR12MB5430:EE_|MW4PR12MB7117:EE_
x-ms-office365-filtering-correlation-id: e9bc18b7-10e6-4a54-948d-08dc21d714d2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 DyIgsP3c2P6KkrsxmozgzIMkRigJPkqk4fdbSLcf91NTB4LKcXAtUbqp39lKJ5GuE2C8+TS0PBx0hHHxkiQHYfP/DT+z7vZJZfAMjJ4NJNnXPwe+ZpN0R5NyO4Sf3WIAaSZBNzKp63T7kYPRj+K+n9+5z1mlJbzWVewO+l1mVzHmRHOUkznLDh++QB6LjB6+cXoaXSPowuBjXTAkmG8VQqE/VGplFWIXsl6B8mOBayWH8Zz33MsbDGsEEHBPUg+DN2h0pquPtwZICmx6XoUNr4diHYieOi00UIzwuiFuiaTQxGRBYKwq/Dal9aXEeHg+ah/r09ZKdIynWkbdGhh2Gkn7zgiFclPgaqkQ7l31xpmj8/TPhwCOk0lr+8X9fpmjBr40wQLNmuJhQjaMWBXuOZoggqkEN8nRwFlxpjtKN4Fah2/JLqD5xBzoqsgm7FlaFAvrCnGYqlhPiNc3+G+8BsBhtGAS93vjix66BP2jSCaZP3QlN/+/ldfdYkKBN8nyV6uVHs5a8T+FAIe6YncHewfBzeDAeKE83efbdmKj4rXqZm04xF2aMifC0tZyf0AaVBOOrUySq3kQI5rb6FQLN+N69+yjtfiGLtlh3YLuBo4=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR12MB5430.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(376002)(136003)(346002)(366004)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(41300700001)(55016003)(26005)(38070700009)(478600001)(38100700002)(71200400001)(7696005)(6506007)(9686003)(122000001)(966005)(110136005)(86362001)(5660300002)(4744005)(2906002)(66476007)(64756008)(66556008)(66946007)(66446008)(33656002)(316002)(76116006)(8676002)(52536014)(4326008)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?K3QgjRAwvdwz7kU8LWlcRkFWvfbl+nw0pLnCRBgQntK2wXHL7W7xQMUpYn3X?=
 =?us-ascii?Q?NNOHDkToZGemXjWDVtU0Ri4GTnz2chFDpD9NqbfemDuv6cHBGM80K00nc3+k?=
 =?us-ascii?Q?G6GHrOZcVVxvowi3Qo97sG+c8O2kaGoY97hY/LApw/9Ub1MCYnZmKbuxnVRL?=
 =?us-ascii?Q?xa/okOEfMcIMR5lNnbkZO7oOWPiWJMEdqd0OUOhxRjvTtCWnEdMn4smAOC9u?=
 =?us-ascii?Q?DvF5OhGmEAscZ7qBv8u3VqTSQtNn0sIRglY4vCl5x1rvokEtnhvuKIoUmR1g?=
 =?us-ascii?Q?RljScnd0dgdR/L6NS4fSd/L7NJfHVJxgYkoyC6wEgZxkTfWQYIgup1hvPpMf?=
 =?us-ascii?Q?T5Nsl1xYNmktE8Qtp+w+NOCx5bK+D+/2nsjzdye6pp9v6l58z0yB2oSrOSCQ?=
 =?us-ascii?Q?liocmiAh3+f1VM+1/OoT5J7sdbDvxANzrMbl4YoxxVlEOAUgKptFE1KWCvLb?=
 =?us-ascii?Q?2j/VRsTeRTTKgb1jTgTzNZVw3YSlND+9D4CxGyH59kFlwz13MVURNgTe1NpS?=
 =?us-ascii?Q?JtDOPfwwjOUkE1woSSgclqCkIOZMqBaxeyLUm8JYngj6uD1s9/r0ilqXsnmB?=
 =?us-ascii?Q?J8Ta3sx6Rbo51UdvFpcPAEKXlrHjWF/2aS57fjAE/suuOcuRk3KEFmJxQWhg?=
 =?us-ascii?Q?KrOZf07zeC3tq35G5i4GUzy+aTvJcr4R+3QRaA9YHue57bVnMmxfbPfAm3I8?=
 =?us-ascii?Q?9CBrRys3McTt/2YMQIgkH8oVITAAOICGXXbLtg4qjVRakqYqGwbW/BKbXVMi?=
 =?us-ascii?Q?PXHxxy9OPAFlYf/CgI9upZOzzH+tMov9ecgecOfpM/YzxAEE63eG7rs6tWoG?=
 =?us-ascii?Q?Ja8PUXRYQEVxAMOgkYNbnl5RTZG7iL6qhSywX27/ikhE0ZrQw0Ix2jzwL23v?=
 =?us-ascii?Q?2bZD2Iee6nzhitIIVbcXGL1XID+hszvtBPgDBOfhdRiuiprfdWe08AcYr/s6?=
 =?us-ascii?Q?v9meXlB6WoHSACphCSAfzDqKEK0XsXoKDDDjY2qvMHqj1LTp4MX1iLUJ+aq8?=
 =?us-ascii?Q?vK96iKYz19mDysU64/Xfyw6VctEm9tC9193kRLDfDooW8DtAodelzPrGY75r?=
 =?us-ascii?Q?PQots2X2vRxvgyMLYLtzQlLG1MBnUjZ6/xD9lreooGhQilgrACJTBuYuYb3A?=
 =?us-ascii?Q?awIOwvBtGh5Olhr5Rw8AnzY8FIi9d/4IveHT7YRu/CfXYpxz2tfJGwaWB2dQ?=
 =?us-ascii?Q?YVxaPa0DE8W3MZiERroXH3Z5dhvMSlzUzonfYTH9Pp7qbQ+pvJA38NlpLG1u?=
 =?us-ascii?Q?g5g9NVn1gqGsRec96LzFMldk9f5eEBeS5/wcrUI3cs7BLJci1gBIXPa1//ew?=
 =?us-ascii?Q?pK6al6ZXfYLX2NK6KpjvCCbdWcvglKzPpglSjwdd/YlJazvBxbmlO9su2N+N?=
 =?us-ascii?Q?ni9CDYri8B6+RALRricNeqVhtD7vJXUBQnmqc9NbOBVYGGZAzYtsk5MagIJc?=
 =?us-ascii?Q?6wweKoz9SE0S3rsTE/Vfa5aJN/gJCTEepXiENqbS8HstUMbTdM3G/e5OKkQ9?=
 =?us-ascii?Q?UesN7OOvP5Vc5/TcFWYKCAVoVjksF5ft7LRc60fswVwZuCbSVIbjHAFeyGl4?=
 =?us-ascii?Q?JsIaydSgWKmlk4e4WqEyx21W9zmsXd8ILGK8SAuQ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9bc18b7-10e6-4a54-948d-08dc21d714d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2024 21:04:43.0390
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aoZDs20CDiTFXow6C3/sBUNmMWoWQwH4KtNMH6CRcRA/f54HSvVkTvlhpXfAHXgJ+ccOQp+2MOE+vdQi/iVWJ1QDMADvOj3heYkd7LD5WlY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7117
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 30 Jan 2024 21:04:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4802

Hi Michael,

> Another idea was to dynamically modify HTML directly from sphinx-
> static/switchers.js, as we do to warn about documentation for outdated
> releases. This way, we could leverage the existing logic.
> However, I'm reading that the web crawlers probably won't apply the JS co=
de
> and just read the original HTML...

I found at least one reference in Google documentation suggesting this shou=
ld work: https://developers.google.com/search/docs/crawling-indexing/javasc=
ript/javascript-seo-basics#avoid-soft-404s.=20

I think it's definitely worth a shot.

Thanks,
Chris

