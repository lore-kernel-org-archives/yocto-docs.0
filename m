Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAD6CC4828D
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 06:45:23 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.111])
 by mx.groups.io with SMTP id smtpd.web11.16377.1707201912480926333
 for <docs@lists.yoctoproject.org>;
 Mon, 05 Feb 2024 22:45:13 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=xf3P0UoG;
 spf=pass (domain: navimatix.de, ip: 40.107.21.111, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kxbdBgazsBOuzvFDcRrAv9310711ZqnnzAuduXyqB2VNHRM69VAJCT0lWBgYdfcxL8llBmV/7K9VUxsoUEh8gcojVXZTLUjV7R4lrdux71OLuCy+MMYBOWPtWC1rjG4pK0poLJYL5dkDVC99uSwKBf1+TmpBAukoIhTDe3hgapBFzEGiLukE6fZUK4mtOTnmNssBr+DUewopHSPm+sQ5jjFoh3ygtASh8bPObGz+FT7+CaHjEWf+tQZbD9ECQYQqamXJFYqhMI/KN8kWVBOh5W914MLpozrRdR4d5KFNhla9Og0oN7mFBzHUUSLad57EwcMWDs/gOKrNUOYTkZTiYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MTez1h0Ys2WSQfks3oDfdSoVhH+qfOXr/yec7KCUQD8=;
 b=n69QusY81Qvrbr1vouuDN82rv/2wVzSorbTmyRq8s3r/6amtzP2Gym254XcnMsT0WvdAKnmfQ71ffZgwXA0z+tc/34Us29qZyY16kaROKiFEF88SdxHPhayri+DNMEGMMTNl1VgOGNdBh9JwC669q+5Nen0N4oriD1vJ2kGxlQrK4BWopwGgmqTAVPjnkppg0cjSAAgAigZ4e/XgvTY637Jql62gZ/59zbucKrbc2YpOeQFucxXtlre0aj97ZfNeYQ21LMOs/9cbE+Nhu2tA2NL+BSVIBG0hBPmo0JFD2CAzC2EEPPoGPA7cETdmub10dYbQAJ1gOqEbxC/KXPs1LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MTez1h0Ys2WSQfks3oDfdSoVhH+qfOXr/yec7KCUQD8=;
 b=xf3P0UoG0Bxk4pTdkfku1IsOHyE8D6vt9w3PQertXCefVmkrEmLtt40SzOSOQHlHEcai1aZH/0JFUGUtDdI2tf0HnFYvDzmarHZKKVTyI3Hqd3GQvvBBGVJa+PlLlTr+5KYjjPi0dAD8YiRnOCBVuG9rNI+WkF1rHIPk0+eZ+Ro=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from AM0PR01MB4627.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:ed::32) by AM9PR01MB7395.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:2c4::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Tue, 6 Feb
 2024 06:45:09 +0000
Received: from AM0PR01MB4627.eurprd01.prod.exchangelabs.com
 ([fe80::ae81:b0ad:f122:4d00]) by AM0PR01MB4627.eurprd01.prod.exchangelabs.com
 ([fe80::ae81:b0ad:f122:4d00%4]) with mapi id 15.20.7249.035; Tue, 6 Feb 2024
 06:45:09 +0000
Message-ID: <78dd1200-26fe-4fb1-8f25-d2d88feb9094@navimatix.de>
Date: Tue, 6 Feb 2024 07:45:07 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] dev-manual: Rephrase spdx creation
Content-Language: en-US, de-DE
To: docs@lists.yoctoproject.org
References: <20240205161309.2958827-1-simone.p.weiss@posteo.com>
From: =?UTF-8?Q?J=C3=B6rg_Sommer?= <joerg.sommer@navimatix.de>
In-Reply-To: <20240205161309.2958827-1-simone.p.weiss@posteo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0116.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::18) To AM0PR01MB4627.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:ed::32)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR01MB4627:EE_|AM9PR01MB7395:EE_
X-MS-Office365-Filtering-Correlation-Id: 255fe841-4ee5-47e3-79a7-08dc26df2902
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nrgtSc+LJPw1dMVnOFLtfLo/VeWl5bvOu6lMNRa2lxMQO42cfhGAJuklqT4xNM6qKJH6If5MPRk9yo/wilNLMILJgfj3qRe0IVhVhpZrDJesPmGqzbllmck2L+2fy/RFn7N9z9Hiqi78MqPYGWqRXH6Q1uyM6vMy5axNASdbvPjHhy2VNN8y5rnOqrOEK3pWT7ycBqkALcc8eR53R+cd+TidRoWNgrBdyxNOmif9RzQFZ9kvRUqLcBLmqa1E5lW3Zhd2HW+aXg1FSwv+4UBhPailtMKnhlupMR2K31jgx5zDEwllBOjRNSbTuQdwoF4wPL7X8f0fvp4LCf4XorixmNWD45p3qeTmzFRDWE6CygJJVbtnx/EkhvpqEc2m1vL2FUQQPdU/AbRI0ByV4Mxmg36zWCfLcN0rV+7KTbHY1bTxBgQUt5nfWRn3YM0qKOSVV4bCRB+UMzLitEqSsbxSrO+tUjQsqnukP1hEdI3h4TJrISRU5jDlB31kY/8gL532nZFsYalZSV0vxEWIyhdICFOgtsoUYi+WqqDJUWAWB4LzgY/hWDaDJXyxNv14/LuBoh1hsSu+9SML9YIU4jWeHy3dFKEht9CmujDIiXwodHcKj8/rkJs7F/BKQsVxPJCR
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR01MB4627.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(376002)(396003)(39840400004)(366004)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(41300700001)(86362001)(8936002)(36756003)(6486002)(6506007)(53546011)(6512007)(478600001)(66476007)(66946007)(66556008)(6916009)(8676002)(316002)(26005)(38100700002)(2616005)(31696002)(5660300002)(2906002)(4744005)(31686004)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?OPe83BTrbIA7GZFpMTixV/HvxNGDSxH5XWFmZpZ4fhoT7xfpAxu6S2egY/wD?=
 =?us-ascii?Q?CcRsd6pBjlwKwb+OTBLrWqBCpIGROgokGlroPYKmfkEzIn6jH6PvaOEeZ1J8?=
 =?us-ascii?Q?cI6bksjCgKvj0dIsol/2AvgZamq3H+ofRvHne0J3LcOPlYfTT0/P2U/ihgZz?=
 =?us-ascii?Q?7g9GCVRkIf6Dg7qKLkMowuvgAYPk26ySJ1JixI4yrIwn9owAjJCMMEsiwoiQ?=
 =?us-ascii?Q?h0oVPZX26s6um87zxB9z28G21kuBGzGykApwWbSlVF7YEK2lVBfdHP/oNIee?=
 =?us-ascii?Q?4IuaYnq3WUGxfa0m6xCpgpaDP7zoUT0tojALbnTN5/KZkH4kQIM5Uv2DnyfF?=
 =?us-ascii?Q?3LqTOb228Eb/bLYPF35chmn0U3ECQB4zjVrOWW8mSu1+l3r/HKDSeXwozwWJ?=
 =?us-ascii?Q?XFnqe0mdGdDAs46c0fG+FPzoN5fx4XPJ09gNoUbjQHfVLjPtfxR30iZtGgK3?=
 =?us-ascii?Q?M348CuJTPnrkGXYUtNX/tdz1H9ETa7W9Jpqmtm/SYG9mzwwouOD5PAhiVHfC?=
 =?us-ascii?Q?RuahP+94Wnn3sV9Apws8IckzLFxhqWGU0f6MtZ4zYvhm0IK6TLoJ7TxL/z9z?=
 =?us-ascii?Q?SEHaPDzhEdbdqtL16WgsAXLiJsU9wnzLPo8dXCf7PTcONBCHFEC0L9bLsvi4?=
 =?us-ascii?Q?oAPCUMcTfvafx+zLq5mI3um32iM/Ph/1puK0xoRxu5GjXnKRCxx9YHEmkjOw?=
 =?us-ascii?Q?uJWdv/SMr6pX+U5YKHIGrvJqZK4gTbwi7ROVFJM5AZ5ts2KrgckM+ulAVIgi?=
 =?us-ascii?Q?JTwcQ2P9A3MwJgXWAF03jA8VDMpPb6qrAM1BmNY/D0Cbmnzgjs5kanDSP8Fb?=
 =?us-ascii?Q?QnuNaZWx3NjQX0oZFLdc/Bah1xixndw5M2XJPleASztn0TkA+VE/7/N9dxbD?=
 =?us-ascii?Q?l6edsdUckp9oJCxTOF6Fw1KSQunRj99llZVXj9HpRxPcmAEiRQvNvWlssu6T?=
 =?us-ascii?Q?o8YNHrNfOt0jBOGWK4/wd5ttSD3ZYagVTPlLGoB1AZL44Vo4jdb0jJRhhxMB?=
 =?us-ascii?Q?ZufPw2jYBiyCLdltN+4EPnCC+2cag4bDR6xUd3Zj321PGTlCNBli53+XkUdC?=
 =?us-ascii?Q?epdgadkR9lz7KFCMuTrzxhmQJrmOya1Ef4HRRmjDI916yIr895mqlDYZZ2dM?=
 =?us-ascii?Q?pzdv+nUneoCiQMu3kXo9wCHNiD6x5zCq0BAOJIawL92up0ug8SNqkh4VwLf0?=
 =?us-ascii?Q?qyUx7IrTFjpVhH2a3AhMd/0LyUwaU0HJ3MlbVc222yb7zkvRMk257th6P28O?=
 =?us-ascii?Q?spm3wJ1Q/pWfDdSC6ZRUKxnEJBSdhNFdVv8nYTkC1SMVmClVPJvbEzlfzGP0?=
 =?us-ascii?Q?4sF1KB6R2KcMoxhOmp7MA0c63L1UiAQEllX2UPsD+uzWV8YMcrjZxeY2gUJv?=
 =?us-ascii?Q?mYWolwnI2/I1G73Ps84DSxxC0zToVU0UasC9f3Paosp70kSsZ8Z+000bp07Q?=
 =?us-ascii?Q?Q7OHX+Iss12wbMkx9BpyiEr0MBNE/5LpHzNwZBKRdofZr/QEU7JP1rQVBPq4?=
 =?us-ascii?Q?l4YROLIjWgCj6oPP8zzb2wa2IKPXQO5cYPtp857lJxZs/x0uqnwCdYkeYpaR?=
 =?us-ascii?Q?1swKCru7qBQMiVNcfCaX1l4VfFUTPUBx7uHke87WLrdhm0ndCEP7t9ASOeR6?=
 =?us-ascii?Q?dQ=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 255fe841-4ee5-47e3-79a7-08dc26df2902
X-MS-Exchange-CrossTenant-AuthSource: AM0PR01MB4627.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2024 06:45:09.2742
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yCTpOLSSKlKrkmSM4PO9gr66tIepBije+XydrA8rFBm0lrsyYjNtZoSVBi99s/JqFBXp8i+GSCnN6+dsMxksxhW29rupejxxe0pbmDebKGk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR01MB7395
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 06 Feb 2024 06:45:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4814

On 05.02.24 17:13, Simone Wei=C3=9F via lists.yoctoproject.org wrote:
> From: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
>=20
> Make the options more clewar by providing them in a list instead of plain=
 prosa.

There's a W too much in clear.

Kind regards

J=C3=B6rg Sommer
--=20
Navimatix GmbH
Tatzendpromenade 2
D-07745 Jena
Gesch=C3=A4ftsf=C3=BChrer: Steffen Sp=C3=A4the, Jan Rommeley
Registergericht: Amtsgericht Jena, HRB 501480


