Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.73])
 by mx.groups.io with SMTP id smtpd.web10.34099.1628844747972517840
 for <docs@lists.yoctoproject.org>;
 Fri, 13 Aug 2021 01:52:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com header.s=selector2-cherrycloud-onmicrosoft-com header.b=nMrhJaUR;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.20.73, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bnxyHnSuo5xM/DR5sPHv1Mh6jHO3K7udiUlnFKO2OKiWMXSUYjqGRHChye0+c5B6zephuItRv7Tcdv7rkPD1jA9Tfacmwb8BnZjK4DViwkbu/BOytUC5gdjBqDis8et6bA5a9MHQTNzCT/9W98hxiC57pm+o86gGhZjHncE8jgnolJiMwZlXsWrzddjjDIQsaA2VhEuT9pDvV6BTWjY+L2YeU7dKWg6+Q9cq3sTuJeFT0E2MKTiaL4Zt8yQcE1MJB5HhhoNp/73u1ep1iXvmn1iYoYnN7l/2qoSHzbyXkhutCInsKM/0LXKND9n/NdJreSs4U1HPbytG17T8ph+mqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lu4Tt/r3wYI37xckW42c51nb2knx58zp7eH94AT9gPc=;
 b=Z4xu9TLXQAN9oZgGMgDKy5GIkdnfMttKjmSkCIxgPsaVqzd90VO8fph6mxADu+pndCdA5fbAjqE0uMoXUV5Z9Z8z8fGWOhkQlwnzyLB4P7XJ2yOw8KfW4yF8bIpPBlvMDk9EH2L3zgv2ycSUdTM7kQSlJ5VPRCv0+84TDYDxJ+yUL76JNgDpBlGr0olPSNVYCigbh5M5kM96TuII61DQXthxqxSrDxspXLn4YNnDGO/G7LkYQph2nyfkkr6y3i/OXal+D4KGzek0jHzMkzeX/gHbn+jZlpQN2vFWHhfdtt2iWozTOrrOlfw6+Kju8JVX6fqkUHMkYX/T1w22N44EhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lu4Tt/r3wYI37xckW42c51nb2knx58zp7eH94AT9gPc=;
 b=nMrhJaURuFjMq54jDoQbG3m5t0zJuBEnIgMuR8UCUyNS0wpNC63rnMvc1A9luCPwvgDkO8qyJpyCyAyysn/Ith10ZJZlfF7cvR7InaWjwVY/XG3jPMh92Tw40VIrfviIhumwL8X2gsg9/jktmIoiQq5c30TlUnAXspS8SAbK5SE=
Authentication-Results: menlosystems.com; dkim=none (message not signed)
 header.d=none;menlosystems.com; dmarc=none action=none
 header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM8PR04MB7940.eurprd04.prod.outlook.com
 (2603:10a6:20b:240::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.19; Fri, 13 Aug
 2021 08:52:25 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::cd35:af76:7542:4dd6]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::cd35:af76:7542:4dd6%7]) with mapi id 15.20.4415.019; Fri, 13 Aug 2021
 08:52:25 +0000
Date: Fri, 13 Aug 2021 10:52:23 +0200
From: "Quentin Schulz" <quentin.schulz@theobroma-systems.com>
To: o.mandel@menlosystems.com
Cc: docs@lists.yoctoproject.org, Quentin Schulz <foss@0leil.net>
Subject: Re: [docs] [PATCH v3] kickstart: document which options accept units
Message-ID: <20210813085223.3ajkjeormkpmhx4e@fedora>
References: <20210813083743.g4a2iax2ybxusamc@fedora>
 <20210813084855.9693-1-o.mandel@menlosystems.com>
In-Reply-To: <20210813084855.9693-1-o.mandel@menlosystems.com>
X-ClientProxiedBy: AM4PR0302CA0017.eurprd03.prod.outlook.com
 (2603:10a6:205:2::30) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
Return-Path: quentin.schulz@theobroma-systems.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fedora (92.42.140.82) by AM4PR0302CA0017.eurprd03.prod.outlook.com (2603:10a6:205:2::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16 via Frontend Transport; Fri, 13 Aug 2021 08:52:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f0c69d03-1df9-40d7-b6c7-08d95e37abfe
X-MS-TrafficTypeDiagnostic: AM8PR04MB7940:
X-Microsoft-Antispam-PRVS: 
	<AM8PR04MB7940FF513197B1017F650547C2FA9@AM8PR04MB7940.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	MPxbdH1KVX8on8dPUNS3uq1b5OknpgYDz9NyJAiK0Bc7NM6rbw5cMjyI2N/eRNmkwlHcic/1kSClvmWxnzbDdDKvs3AODp2qY1w+ZZaYCUkNrR/x5ClyR1v4Lwft74UUfPA3BWIo46N1hjpzBcKNAN2kdmGo/ga7PrYadYAnzusARjeDn45aFPF0KZlBAqGHjem+hOnoblO5yJu9LFgtOLhPGtEx7/OK9Ho8PieatrCLek21aYavBjueDDuEpPZSkY6Q1OWqFFbZWgiQsUGTuhjC4oOVqpOywoDEkXhwor4jOXo+F5wZKhT3Dv0er4YgrKukcxtnQnBfPXP+288vD0YlRfN4TiGYW5gjGnpX6ub5BROO04rdVMhthXzpqu2QBxsOV77ZXc7JmXnT2HnzffB35MkLbGP2i1REbuPd4wWxhdYcVEtBZdxccMQ4gTWCwbota4qKoJIz3hnxFhjcShufrs8eSzGwBhvm1YUeyyDaAnlrL4+7wti2TClvw4z6J8+QNXWFtfIVClAHSlCC4ZfWERP9zyXcenXk+J+yJP3wUnBvZDOdaiD/jTMcgp60BXTbw508Bf6sJQbpK0E38TQwPUO9U/aUZaJscRuNjg0/R8Xcw1vPxO783seRROL8Su7b62GVxnmNxC+/wDdWC/O6MIxE9361FBWJLs4tQw/9/3VT9EEuy9GZgdVN8iXa
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(39840400004)(346002)(376002)(136003)(396003)(316002)(9576002)(8676002)(4326008)(186003)(5660300002)(33716001)(26005)(66946007)(6916009)(66476007)(8936002)(66556008)(86362001)(38350700002)(38100700002)(55016002)(478600001)(9686003)(2906002)(44832011)(956004)(1076003)(52116002)(4744005)(6496006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?G0QnfmyfXw8gX9aDIPrW+qSRDdh3iwAdop5wr30qR0ISLpxfHzeaTsTCtmwH?=
 =?us-ascii?Q?osoX1feKpX+sb+17TtLJICnKyePgevzL/wU0pHH/KEBgfWWztARrwI5Xzb6h?=
 =?us-ascii?Q?nB4hReTHT7/1aXAgH/YUe5UWzYAxDaajBgDk8rEBPxvyvLGZxU45FUH7Bmxz?=
 =?us-ascii?Q?CFJdwgMOLeoYtTDDwzxt+VR8sIO6WgiOfo8buM8NXfxGsPjM/VKsONIIC3Oj?=
 =?us-ascii?Q?LXWJRsTTMfY0b4FPdSaEQbD/ryYRgtGUkH+Em/9TlMHHDCqjlSXpJHNJwago?=
 =?us-ascii?Q?W88QOGs7s9EX6Y2q3MCuybZUOVZfr1kZJOgeeTmkHEfMz9/eBOs0IlQ9qpIk?=
 =?us-ascii?Q?bobuO3j22Fr7yZ/MFNop17LxIF1t0jWUSUlTNBtirLjHeVd92P6oUSzetma8?=
 =?us-ascii?Q?vUuhTmmLQUBsXHhin2aEBK2J7L8O3QOIBiaEQYwc4v/rXhbIu9SPfTXjRUWk?=
 =?us-ascii?Q?7u867JA4UXR7xfe2HEZ06IcvR50/fVsapjZhw+4dKUs/HhWCXgBY/XW2RsVK?=
 =?us-ascii?Q?Q5VgazVKqrBB407slM+Z2njvOuLIn9N0fICfowt1sxY6BAA1Qg+LKRpu1flq?=
 =?us-ascii?Q?nCwdhqEA3ZEmuq8C6NenmSuEqOfzKRImv/UelhWppPfDl8ed/RBGII2dhKKm?=
 =?us-ascii?Q?2wnucg+xrcZKT94TDJSS2xt+64d+di3FWsDJFzQFad2HfYN1IVxWD+k30/FB?=
 =?us-ascii?Q?O0S627+HZYlMigvrKyPPRK5PHQkO5aYMq4it8OWrvpN3k6L9LDewOzLuZr7/?=
 =?us-ascii?Q?zAocNHW7gFCeJkS9FpZVf7VOthiMJqApKgf6GHVizpzw6NuXbJZQpstocZep?=
 =?us-ascii?Q?k+ckI9y2y1+sQydHLb7daJYTeohDHoPYKH58si13+j9cbITEEZnb4B8m2SRm?=
 =?us-ascii?Q?BV3+UBsBgpc68G5kFxZr4buhzESVBt6wy2041t+iJdhv+yV7BGUU6E3/zwTZ?=
 =?us-ascii?Q?YJ2w0IRN/JdVuNzVp9gkqXcPrdKAMiR+kV5eAqHPuAq/dH/7CeMtno7Et+Yg?=
 =?us-ascii?Q?vnZAAcsnAzMpw1CgzbfxTfKI3R/UORqOHSIikO1dEhNBdVuhOvNYIwtteuZJ?=
 =?us-ascii?Q?0KWuwIRALvviEjdem0hKZB80F2rJ3y0nP5UtaxFhM9ymJ9HDvR1pDdJKMJx7?=
 =?us-ascii?Q?Wh2DXl9+5/ZwuEnpONvOPKAjcuM9M6IHeWjnMI6Wb/Eh5dzhduvNGV9PBcsB?=
 =?us-ascii?Q?e4vrcYhhkeAbO8JCy6PBUG9L5xI+fF5xRK7fVd0gBRFAXWlky6arWZmgZcLy?=
 =?us-ascii?Q?yv3uv2raEYS3oWVsgnVojUT5ECQb8SGd5FYbayWC1DDiixWpJwHorewJUxdw?=
 =?us-ascii?Q?OgDSYXpDCDHfd79NyWVn4l0s?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0c69d03-1df9-40d7-b6c7-08d95e37abfe
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2021 08:52:25.2904
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UdQEjuoCjpROJOkvEyvsKuNGdYRrQe/hc6wJa2or7yyNDkfB706VJq9HuUJrJENWdDJbtAdlDh3SUKqpsv7cpcjqNVezmW4YOWCQtTVznpaeOX73SJsbUNxCuDkBRedk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7940
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Olaf,

On Fri, Aug 13, 2021 at 08:48:55AM +0000, o.mandel@menlosystems.com wrote:
> Document which units are accepted as parameters for the four options
> that accept units. Also be pedantic about using binary instead of
> decimal prefixes so readers don't have to wonder.
> 
> Signed-off-by: Olaf Mandel <o.mandel@menlosystems.com>
> Reviewed-by: Quentin Schulz <foss@0leil.net>

If the content of the patch is the same as v2, there's no need to send a
v3 to add my Reviewed-by, the maintainer will do it when merging the
patch :)

Thanks again!
Cheers,
Quentin
