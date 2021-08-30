Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.65])
 by mx.groups.io with SMTP id smtpd.web09.14171.1630310616027343002
 for <docs@lists.yoctoproject.org>;
 Mon, 30 Aug 2021 01:03:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com header.s=selector2-cherrycloud-onmicrosoft-com header.b=evp8so4D;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.21.65, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DMc4RPixCJRvh4VzOsQ17KgNFqfL6GFjgpSNpj743jG4knVlzLBNHsDgHdXaHh14yAX5JYBp11VlfNgqhKa/KnxZ3I1/nCd+7sEsu2qpQy2o6YB/zqCSjJOteW27oyDXCwHcAyo7N8EzGnZ3uYwT+DtvY+YRMI0aYkUxCUMdjl7xrJEMwC+z9Wa+aiV0i7MrXct2htiqUZc2U3Hg80u8K82+av5QS//P+CpnzFsFodU+dmXqBft5R2np0cJwGt1YD0qh+++yJu7SZJnO03O9IeiAwxsdJvKjBgl4DEubky7iE75wARMpPa+7uvq1p/JZ0XNwLG9Ucvc1/Kmkol8pZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QdjHZ+RyVcF/+VZaxnqB6KQ4fyiCzunlga0S6HA/WtQ=;
 b=deNIhw5f4KciVi6QL67reZzF+5HCDxItcd2SqkZT9iO/kOboOQEIrSUdC3zYfB6tsogHiTJeflvZODRJNalCumIxOx/CPChEWcj3FqG2c9jy5QG5vPuWFyEsfkvfGsHoDumS0Ridm+cTXMKW8ySRi//2NafbUkMFjoXg990/9laigXUy1VS+AgA534CNSM9C7NfTXTBC+rDaduk9uTKdEFYXsXwyse6/uhEfb/RWYjY0Buc2TXaMsDvXgg98gmSNk1sWwjQkkZTHtvLXvZSqI518AoELKgYh3rSTqD0iJjvBp4E7iB+GFqT3vlI86aGrM9vSvRlgp9SNSRQgxc0Mkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QdjHZ+RyVcF/+VZaxnqB6KQ4fyiCzunlga0S6HA/WtQ=;
 b=evp8so4DUPt15NZ8uQ1j1SMHLkNyE4Aa2IpCI9FKhlzy9giYtHsK2n+tS991Npt1sv76khbRN7Kg8jPthhLIr35vnejo+0QCNTzX7SHVYzBUoCNpIVnDjsHQE8r7Hs8XDlFbrXmlCd0USsO78aH8GSI82qgfR8e1p4ruZYg0PIQ=
Authentication-Results: crashcourse.ca; dkim=none (message not signed)
 header.d=none;crashcourse.ca; dmarc=none action=none
 header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM0PR04MB6193.eurprd04.prod.outlook.com
 (2603:10a6:208:140::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Mon, 30 Aug
 2021 08:03:32 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::706a:b082:742a:7d00]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::706a:b082:742a:7d00%6]) with mapi id 15.20.4457.024; Mon, 30 Aug 2021
 08:03:32 +0000
Date: Mon, 30 Aug 2021 10:03:27 +0200
From: "Quentin Schulz" <quentin.schulz@theobroma-systems.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] what's the standard for em dashes in sphinx for YP docs?
Message-ID: <20210830080327.zasqwk4jz5me24p5@fedora>
References: <c81c363-94a9-da8c-4d9f-32ec8415d245@crashcourse.ca>
In-Reply-To: <c81c363-94a9-da8c-4d9f-32ec8415d245@crashcourse.ca>
X-ClientProxiedBy: FR0P281CA0083.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::18) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
Return-Path: quentin.schulz@theobroma-systems.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fedora (92.42.140.82) by FR0P281CA0083.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1e::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.6 via Frontend Transport; Mon, 30 Aug 2021 08:03:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4adcd39a-6131-4a18-d9e6-08d96b8ca8a9
X-MS-TrafficTypeDiagnostic: AM0PR04MB6193:
X-Microsoft-Antispam-PRVS: 
	<AM0PR04MB6193B5C796D3B15032B8CD5EC2CB9@AM0PR04MB6193.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	W8XAwbZ1Dv0ihxOsqjgTbs9KpPLbdKTSbj7K4tpD4hahr2p0k2NjiItm6MaLwgrWvWtvXRPRUuHxV277SWAoGHBCg9XMrxWcTA2f/54UVNuFlrPRL6oej5BDHFK0URekSXf1R5rwVDq8y6ZdrxhJsWi31HLOtMSonNx2EEYIKWhdtrsnsHsy5KVxiuxp492Vrzs/WkyOfPIL1U2f5hBMlTOugPz/ct9yMhZlfUsrsGBwuy+/WrEQk8+oGIfL0/XxrQR7nNmqo8Kx3TOViRd3E9MwHjDOWcpcBZhui5744tKVtYbxjvslOBwwGkocxFeIB0GVhXnzQZ1nSFT5bPIiKlxAVkCIHTcpXUx+pah6nSAZjivsx/fzeb9ypTqs9lPYCyfvRIeqQRWwJpAt/xRRO1ogbp/Az2n+tGBbeTlHyS+uVIL0/F93LrK2+OR8LIQvPDQugQHIakWE5k9CTD7cUzX6NI5VrLP1v+n57E/SePf8LH9mI9h1TbYIEMvAVKKyK6P37DIo7I1Xz3cubeA0rT64ySxfglE4G+sAESnsVzeLG6DxdgDpuccNWpk5Qon98vmnVfUAlFwYjS84laokLe012Ctw8qIJVidrhVq7ohOLpNHdl8RsK/ISqodxrwS13Yf4SsGojcH3E/GQafmOij0Da+/RoLfYVNIn0ajYOFpDaLDZiTc6yQv7sD1oi4kD+c/UdYr7FPacmQT/HrzC8A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(366004)(396003)(346002)(136003)(39840400004)(2906002)(8676002)(44832011)(55016002)(38350700002)(956004)(478600001)(9576002)(33716001)(66476007)(4326008)(9686003)(6496006)(52116002)(66946007)(1076003)(5660300002)(26005)(66556008)(6916009)(6666004)(186003)(316002)(38100700002)(8936002)(86362001)(4744005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Za5PBcGzSlCnzoskOEp3ABjhTRjigoeoJypRPwcyKuDREUvqcURE3DEqgDvn?=
 =?us-ascii?Q?a9t0E1AOFVt+EFefISj4AEBamovHvQ2lcI7W8CeD8nr912VFqh6QdV9xd0XB?=
 =?us-ascii?Q?VpW9deqehnCDaXkymRPBBjBEn9h3tIGECTYoHJhCCNOOA+x1kaz1DkP9MPNJ?=
 =?us-ascii?Q?6jzxKLUm9PmiJ1upBtUvKfpwYxzUz/VKJ7OPq9oK3aKrUp/5RZH0on66Prxl?=
 =?us-ascii?Q?ZR5uHwsXRnuKswLkrm/e0VptNMIeFqQSpZEgefXdVbItDIs5U29VvinevaJ1?=
 =?us-ascii?Q?m4xJ80p2m06wz5Z9eZ0H1TXKfLZQSDOrUiJrYODevLMCAbLS0bJK9mm5JjUI?=
 =?us-ascii?Q?21bWnueMIGtnz5M9jOmzStyyqQ4m5LssizB05p6Vp7YvUFh62lH6IQsUjMdB?=
 =?us-ascii?Q?5tX+Iz8r14Jendm88EQz8zPhrYQsPscqjJxoUDIEhXCD1k+dpM+bDW9Dj/i5?=
 =?us-ascii?Q?33KEPnlCnsiwMWgTbrpDK4j4eOoEU6f/J9oB8/Zi6DE0ieA4mNO4QyGop8Io?=
 =?us-ascii?Q?bVC/8+QAOpDM+fMgAeNluLQKv7UEN8uHJj8MjBNxycXiA7M2THnYjVfeIPUJ?=
 =?us-ascii?Q?M9EEpabX/LJOzukH+esGzi9GM9NA0LLJEGMSaoKJTdXPlnclzbmVH/YF575/?=
 =?us-ascii?Q?3gcySDxTKeSigtUkISEDrlrDqJt5QoISG/wteswLoFh/uUDhstvOfEoQTFAW?=
 =?us-ascii?Q?l6jq7IwuEiN1ZcgdCMYAO9WYAp5y2UyQgW2/TE8H6X0kaO2s//iGOlOR2OG3?=
 =?us-ascii?Q?aEz03bkmcyn9DfwZQwEfRDkc0VK0xmbFbdD1rn/HI0U3BlPfRPE93Vi045I8?=
 =?us-ascii?Q?e2s12Mlp84sB7mAe8b+mEXEMHT7aze6ic31Fv8rcakGEUa/QcdtBwqympxyk?=
 =?us-ascii?Q?eAxwx7zKnZaf1XbZ7aH3JX5JwJN6SED08CCNWvHmmMRQsf7rCWygKJFh/AOi?=
 =?us-ascii?Q?uxsBbKqFZPpI5hG7mMSr4JNac3w1y6e0DLVbZ2dLOH2qseMQe6Y3he7J2LGc?=
 =?us-ascii?Q?ljUniQq9Me+k2XYDlAWvMidtLgIXVjn9amW1QFwrelfEcolQE3XrWb0bEqju?=
 =?us-ascii?Q?uRtkSeCAtAJ8VrfPHjGLSjgvJubAq6iCM0FUG/amafG9zVVcrrdFxlV1de8u?=
 =?us-ascii?Q?JwR6zEfpGBOxvSNn6HULJhhIUascoFxVvo6ueeLhO6YwNyi/S2uDVeE+YsXD?=
 =?us-ascii?Q?T00ksjUtridc+/0SXkf+2UrUEx/O3BV2YCzZudTvq2C3BRXpwUOWwwl5qdpL?=
 =?us-ascii?Q?YnAc1ZYIp2pVTclImh8Lmq2LLR899Xq62M6hKTg7j1nkOtklX0HueBEkPHP7?=
 =?us-ascii?Q?r9/G8/iGzRp8lgdMFX9v9YCy?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4adcd39a-6131-4a18-d9e6-08d96b8ca8a9
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2021 08:03:32.0412
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MiE7ySyDNWsoABje9mJeSbNQQadZAnqPGLdC9EPW2+//ycmv1WAHPGlWBvA3+VKfWC1fPi+7QjP05oZLQcWXcqjYz+pvH6s5Av1zPC7EcCBXpP6I9mNy/132VqFaJf0y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6193
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Robert,

On Sat, Aug 28, 2021 at 12:08:34PM -0400, Robert P. J. Day wrote:
> 
>   i want to play with sentence structure, and in some places, the "em"
> dash is clearly appropriate. apparently, a triple "---" renders nicely
> into a long dash. is that the standard?
> 

The only issue I could see with using "em" dashes is that it makes it
harder to grep for them.

Also, we'll probably forget to enforce this in future patches :)

I don't have much more to add to the discussion though.

Cheers,
Quentin
