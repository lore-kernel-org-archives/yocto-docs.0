Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64499CCF9E3
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 14:48:01 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.14])
 by mx.groups.io with SMTP id smtpd.web11.13357.1761317275836198611
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Oct 2025 07:47:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=biyjKgHe;
 spf=pass (domain: cherry.de, ip: 40.107.159.14, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wTUsY1t5bkSkIyTnboow+DisxXZXj9RRFGtap97hMP/uXsVxldOpVwmf4bTGhQX9EWjCInBBwoTm4kxyr+/OQq1KDnhfD5dB2dsib112X+k7cyW8LSJcuzBcefnVmFc7roHzug9fjzggVn0rbD0+7KX4qrMHlWxhCmDsVELTkV8XNSoPV9emXBIGY7DdE9ZjIoPdQewx4s5Ud2dAn0be+JemUme0baXWN3/QzRi4Oe9wysAfRBZqeNGbeXi6LPHJP2aAGQqDtI9GnhmuXNDZxjF9o7gt+xgrEuO5qZJ91tHZM2LNpYkRKZ+PD2g/LxOsoGtkcYPg8WQea95BwpKkKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pSdV1CaqN4mGGsuub+x0d68XbEHC7shuymsYAnFBp38=;
 b=aQH83wkFSEkqHoKk7M5US2BZubcaYHiXSp2Q8Y9yttXtCykbY/5Z+hINry70bS+Arx4Ulj/RapRDA/HdMI7c/LYEeGlIgT1CEIhaOd/5Lm08QopxH8IGudhO+1EzkELb9QGxFZrD9w1+NRk90ta0wVkBcy8O/xegvaBQb8vo7peLPIML1V4QSxvkqKmMB7fouzbbwGBpWIHl43NsAyTbd4zhfOKLuXrHN9L8wlrw/MxD4/1nxPoT+9cXr4oqlwMHhHzvsnumGe0FNV73/htmGqDKDhbGaixCilg8ZSRNz320kyD3yoVLpdeHsenNKYOR6L+YuCPhORLHQmhoINNDrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pSdV1CaqN4mGGsuub+x0d68XbEHC7shuymsYAnFBp38=;
 b=biyjKgHeU0DVC2UHOvkOBJr/sPGvbb6tw7nmfHD550cnEvfKNyPZRMwxAl5In0+sblhr5jTtdMo7N50cjFGSGahpgBnLzLwXGJujYjNvx5zAM7ZukHvH9pbsIk/FLFLKimcJ48aWy+mBo7intmflMl3Pw2wu0HDeQhJRiXxhv/g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by GV1PR04MB10426.eurprd04.prod.outlook.com (2603:10a6:150:1cc::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 14:47:49 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 14:47:49 +0000
Message-ID: <9a46832d-352a-4420-8d36-15fcd89b555d@cherry.de>
Date: Fri, 24 Oct 2025 16:47:48 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] dev-manual/start.rst: fix typo "RELEASE" ->
 "RELEASES"
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <4b9f4516-12b1-ac82-02cc-614905b2971e@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <4b9f4516-12b1-ac82-02cc-614905b2971e@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0250.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::20) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|GV1PR04MB10426:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c264e49-5b1a-445f-fd86-08de130c4d1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?lDdAiRAcLaC7uwv9qU3Zq+vc5sJu29f9K4Y30PYLBvDq2usUHftLdJ//nuQv?=
 =?us-ascii?Q?ZHeQTzN2Rc3X6IzZwSEbHPvn9MvveMb0X5TBAJuF1HzCrVq18SvKiBK3JwzE?=
 =?us-ascii?Q?YQ5MTctC1vFAQMnC18sUnd/fFXi++P044WzxxHCV+utRrlV5yCNdsVqwiQOu?=
 =?us-ascii?Q?Pbf3q/IS5kT0RIIkQBLUPbOIfLurD/xPMAefE7M3+8wnwKcgl3YxT767+26I?=
 =?us-ascii?Q?8SE9+hOzW0PjVBIyA2gfU4gw3NbRU3hA09bOCNQwUN3+1EA1ixTyztwCdgQr?=
 =?us-ascii?Q?PQEsxAJhEX/m2VdhMy2zZmVdSWnCuM0JpbZt+Bdkt8c7Ponp/4J8mdRhBk1/?=
 =?us-ascii?Q?yy4y13xgK10ShbLa8VkBvtpSliDBp02S6zG4GWpvRsBfbZ0sjJDWsJNrBxpV?=
 =?us-ascii?Q?BBNjmtOcNa7YWfyakyKr7WW5lHkWoDQfKNHD7HbFdy4tf5wIL/uW2XDAGkMY?=
 =?us-ascii?Q?yGs3v1xrYEoyGnAWGBjL5trbeCsEKvuNg8lawHT7o1wAYenF18AF2yn8jSGk?=
 =?us-ascii?Q?OnB8NJlEj4qO+GtKq7wgu26WXT129oeMuI0N5cRNQV8PXHxtE5XKuJ+xKPX3?=
 =?us-ascii?Q?eoCIILDa0vA8XbL8o8c86KEHaX05hg9UrgPBLXPNoZRuOZoSO14rySI4rdWB?=
 =?us-ascii?Q?HHv1CUV5vqEhaC/pGjJhSaGiNZNiAndcmNR4h2IQhdCVJzYhNbdxAN2f+5gN?=
 =?us-ascii?Q?eeZuoCY7kxWU767S35PGsX9uhBZnDG1Ta/o+xj6mmp2Qad78sUeOtVmI1ZFY?=
 =?us-ascii?Q?W1w/uj+EdyNM6TksyfKgK5ZJkmAxqW6GjZeUJbuxEhs8tSf0JNe3/qAnLeq/?=
 =?us-ascii?Q?GtevtIIwgvZmXKiqlGDxf/jqXknfxvgsWfVGUZUv+GNZTrFdsZ3QVFndO2Eo?=
 =?us-ascii?Q?Ab+ccVQJaQQYe79AkwKuHazTF+4liUBDW+uZgw9oZ60a1x3Xx0N2/i9EUM6b?=
 =?us-ascii?Q?MU5Rj4dkDjYS18SpJsxBfrbFR6+aZIIbyR3ur1X2cAlktAGu5u4vWMFI2zut?=
 =?us-ascii?Q?FILSiN4eHL+/VFh7vEZtRUaWNZ4ZS1iD9N71DejcAFcRQdoafExXsWgPdwZN?=
 =?us-ascii?Q?q6NkeItRZXo2+/7jwQf2LfCpsK55SS0ccBV5huxPh2D0eiUHFDAARwDAsYR+?=
 =?us-ascii?Q?d2TF4Jvtslsnuk3ePUGWh8cnQgcJ/aXuk8Ic9LavNsbjpJtCrt9w8De2GbCJ?=
 =?us-ascii?Q?X4xuBxJDOXChWR0I2fgzzM008zFZNPA4DCI4vEZz5I3FjciITj1eHNY2A2Tl?=
 =?us-ascii?Q?ZSSM0N6wrk2zhDcWgWNaYGgYz1iUIPWYA341a3lFbRLsmsg6vOl8qUWxd1Py?=
 =?us-ascii?Q?SRKjWXtWLOJVBKBBOecWzK/UJNa9wg+PiJxFlgKy9yv3xaebTkrZtVkjC1NU?=
 =?us-ascii?Q?ZopkP6QzcKp81kNNo4cU7t3wKFxIorLWRh1IB9xWZJIhNs1V9PAuC741kAiy?=
 =?us-ascii?Q?QZjy7e47G/jR+kagG7qFVuA3vLZ2IKd4?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zH6IhbdHEO6FyU0tcYqdX+sM1mSc7mHa+McMOCo1iDiNDqOp9hH8pC7O6MFF?=
 =?us-ascii?Q?RqhGtFBaGZtaLe0nK2Zqc6ZueVnKtH0aZQDL4ruOg5fnLY6l3KQwmnpccG3W?=
 =?us-ascii?Q?/TOa+NxfGxbBLkULzeLBckGCkzAxLAKc9IJwSH3ri8jTORQGh3JbIKxfwNTc?=
 =?us-ascii?Q?SJGwraQeCnOvX+dCBA4k8YK7iGihOEhvm2dipbvm5qI8Tq4Qv8/LfOCIO2kR?=
 =?us-ascii?Q?wS//vwtAyeOF6vv2K6TGRZkI1WYGEbY9t6eCsk4UoMDdAH4ad8DKyDQNDNLN?=
 =?us-ascii?Q?z5bLRPCyZ6qSO5TsQltD/VWtg1yvabJBUQSIRlHQC4Z0g3N6PJ9vskfz03Sa?=
 =?us-ascii?Q?5jfL1nGO/9rXxHPq2YJNFnmqHxMPPsg3qfC2sdNtfxCWr8y4IBJubRP9/TIS?=
 =?us-ascii?Q?Qt0/yxp6HWZ+yYM8hq0L69IHY1iHkvVy4hb4q92kW2hPv+hZSsHxqcwigb8B?=
 =?us-ascii?Q?2r4Sqsq50nsx36TtQVzJ+HbVwlZ9Smk+W4ecpgK87psjCF0hG+/xSZOnC3N6?=
 =?us-ascii?Q?zoW/hTSKimg3M3KNw5rdSaALTS7rDIT0TwLzy88tO1V22MIet7jkIgT74VLY?=
 =?us-ascii?Q?25PAbeJXIIohmRgswCm3JrGPiOU06ycOXDXwvCvyw8LtDxjesjGX8aTAunPp?=
 =?us-ascii?Q?FwM2yP6eFKh40zVXrE6dsZgGnhUqGlSCbFTuMtHo5Bss12B2kxYFp65T94d2?=
 =?us-ascii?Q?4+9StGoYrRfozCcQHorj3FsX3NyLBJR/zeYWuM+U7kFrQmJhgQTCa1jeJUVx?=
 =?us-ascii?Q?bbJnC/TbWwnKNIz95v88Fr+TDtHWq9q80NJIbuB6PDsxaB1OI9RRQ9X2VNAJ?=
 =?us-ascii?Q?Ndb8tXYIlO34DJbFSG3bWNELkufpmYiR7Nn5ERq5my+LfWbdhXgU4Xy1FK0A?=
 =?us-ascii?Q?gJQ2GqmydKRgjlNzeFAtgklTW0c1HzkVObiHxE1teutrmYyhpZYUMHP6s0kp?=
 =?us-ascii?Q?FgP2MmRqnzeudr/9jVN6EzC/P6CDZRqnlWbui8fe/4UrEosvOdR17IKFQB26?=
 =?us-ascii?Q?0HQFo+lyra2tCd3zhh+g9JtjFRM/tUDCCanSe2goQT6cDhqvn0rBzKR0sEbb?=
 =?us-ascii?Q?jq5ndki8fB1d/UD8asJkSjzX6bQHvxwXFpbtVJX2LytdKBpmsCWTwTZHNvz5?=
 =?us-ascii?Q?RiEmyDi3FkhPlMooAdQrgRuzJvliGiKBbUV3eAufd83+4YqSkYFrIidP/o/6?=
 =?us-ascii?Q?5OH4XtMJuFk/6M4IYfYTsDUhTBWnRi7IqQ66gth+7FG7cq1Sek3ZnbVmrHvv?=
 =?us-ascii?Q?eYAkKpe3/lWdAjVy80cr9qcKgkSbU3yO0jaHDKCJMNSRoyB1HfeCjYNyqwnW?=
 =?us-ascii?Q?XXdfBUWyolYQbczoFta7lYgs4wWJQ2Zd2k4w36RNbjPYlM3KccLGTqsUYvSO?=
 =?us-ascii?Q?ZwtL0iXgYj1LQYpO7xsHD4j2lXyhuUPxPE0HxOMum8BYCtEJRijb07vhTiil?=
 =?us-ascii?Q?nbH5ffmnLKXJLL5ucRZgUNATFNTfsxZMfp+H1gjESekujkFca14eHRiRt6oB?=
 =?us-ascii?Q?9mXQgnRhgpYZuXQEHtifVDSgUatnlMGjzvWcUCkrHsy4xunFICcViDjjwl0y?=
 =?us-ascii?Q?xcbIA2vnuSTDTdRQv4uL8paUCvaY881+qYp+rita0trdfAYo92kIHtlyKQrl?=
 =?us-ascii?Q?9g=3D=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c264e49-5b1a-445f-fd86-08de130c4d1e
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 14:47:49.5763
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OBAZ4NzKAHlCDJyLAMJHRfWstTo3jEgCX8nUtiUI+L5nmdGxMDByJzBxJfPmytbkkJiTATieIVwFq7f6fHa63SReH28ezHbFGM403hfg2WI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10426
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Oct 2025 14:48:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7820

Hi Robert,

On 10/24/25 2:50 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
>=20
> In addition, some minor grammatical tweaking.
>=20

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!

I'm wondering if we shouldn't simply this section. Why do we care=20
**how** to get to the page from the homepage of Yocto's website?

Let's just link to https://www.yoctoproject.org/development/releases/=20
directly? So we can remove 1. and 2. from the numbered list and reword=20
the first paraprahph to

"""
You can locate and download tarballs of any Yocto Project release from=20
`the Yocto Project Website =E2=80=9CRELEASES=E2=80=9D page=20
<https://www.yoctoproject.org/development/releases/>`__. Rather than Git=20
repositories, these files represent snapshot tarballs similar to the=20
tarballs located in the Index of Releases described in the=20
:ref:`dev-manual/start:accessing source archives` section.
"""

Cheers,
Quentin

