Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.51])
 by mx.groups.io with SMTP id smtpd.web08.16746.1630329060022948448
 for <docs@lists.yoctoproject.org>;
 Mon, 30 Aug 2021 06:11:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com header.s=selector2-cherrycloud-onmicrosoft-com header.b=dUOqmoeV;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.8.51, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MLur/I/AMJSSZqvLa7fLXSV3sCHXfAJDeCHu/zed/t6hS7bXZBsf3LM9AJbq2cHp5rXsg3H6gamGXb3VQ2yr83whpHielpdaB5LRPeC5d2K/szi9ntd0TsUgkm62Uian5SONlSnSdzjuOWiwm8BsMu82REo6qn9zBTwcOvBMz/EWiHK1fL7t+aJ03lMbXnoYTlVVD149X5hgCzTnjMoMZ1a/9BV3YRAhwlKoZQ/dU4pNbpPw523gDjYVVkR3JdA9v05HQPOzLW79H7UCX25aUQOn3YKp3ch8iAV5rrYExI0gJqWhL8abHjZ9pGZFsDTJFVMTLOH2X1m383rnZoH7JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JKbFvx94ot/dzYkJ/xKdSp4SIiXHXFRoyS5wDx/6OTU=;
 b=OVtCEDITTpYIAFCMchhg4EXLz24vrW5WB00nCCmsVtBar4fxtJ+C5Yo/GEznnAlT4onDMKuiHBJGSNlCHpyYDrkrZKoBtghZiiCCrKZIcNCAULnuzS+s/JUBsrh/0d/4+Ili8mKhHiJfx/glP9UIKhfXIE0Up2mR53CKw2EroFLwlPXEubb4Od5Qo9gsN0jnd/UqWIP6Z+70LGzy2Wxw6jvbvN1Q280azb7UNwwdk8dWDSyI9MlCB6qDV+q8tXZQzYkATlvLrxlwRWO+18FVjcyshf24t8K3f0D8YbQpkAewUKwIhwJaui6G82NNE+MrvOoehgTVXKRZEvR/lE8S1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JKbFvx94ot/dzYkJ/xKdSp4SIiXHXFRoyS5wDx/6OTU=;
 b=dUOqmoeVCA5pSslh2I7dtI2qFDP8/QxehWx/QTdNCxsUe75gIQ/w3ELf8mUMDqY7pxn0bvBNLMbwq2aPeg8y7N2ZUifXIzgmc7cllKsjhJeWZkS+YDyTev+B0PKRcYgKt/nVxDw/iWcnSXQsgWuwk/act+qLSmpSSVltB+bcph0=
Authentication-Results: crashcourse.ca; dkim=none (message not signed)
 header.d=none;crashcourse.ca; dmarc=none action=none
 header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM0PR04MB5249.eurprd04.prod.outlook.com
 (2603:10a6:208:c4::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20; Mon, 30 Aug
 2021 13:10:56 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::706a:b082:742a:7d00]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::706a:b082:742a:7d00%6]) with mapi id 15.20.4457.024; Mon, 30 Aug 2021
 13:10:56 +0000
Date: Mon, 30 Aug 2021 15:10:54 +0200
From: "Quentin Schulz" <quentin.schulz@theobroma-systems.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] dev-manual: pass False to d.getVar() for devpyshell example
Message-ID: <20210830131054.rivxseengnuju4sz@fedora>
References: <fe6cf3af-6c9f-a4c0-9f5b-48beccdb11ae@crashcourse.ca>
In-Reply-To: <fe6cf3af-6c9f-a4c0-9f5b-48beccdb11ae@crashcourse.ca>
X-ClientProxiedBy: AM3PR05CA0153.eurprd05.prod.outlook.com
 (2603:10a6:207:3::31) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
Return-Path: quentin.schulz@theobroma-systems.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fedora (92.42.140.82) by AM3PR05CA0153.eurprd05.prod.outlook.com (2603:10a6:207:3::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.18 via Frontend Transport; Mon, 30 Aug 2021 13:10:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a4b4cabf-191a-4958-748a-08d96bb79a5c
X-MS-TrafficTypeDiagnostic: AM0PR04MB5249:
X-Microsoft-Antispam-PRVS: 
	<AM0PR04MB5249E8556DE4DDA4112FBFA5C2CB9@AM0PR04MB5249.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zH6HqPtnDS0dVSE+JEKQBJg780WLWAy//vHZh2Qnu8FWncfzAUMCadT6YjHqcSqj6V+Fs9mX0y1rxFh+xwWhIjQmoQnr2kyck4tBkmPGoVr9mWAXcf9pq6V+Sy+dIxqQ2kSOB0av1tJfgCBQSLBpbEjfGEpNNslZ6MJPZDg05WplDEaK+tBZig1JhhlDD5UtxJ+mPcbsIlux3p1t1BDbxfmtwTp/2wNooc8To+Hd8enHpXcwxJSasl7Q0ratVJTnd+1zw4vRM+Wv/HkK7EtglhdYTt2nHV4QdW3DCEQuDq8n7JBTUqYlHnZmF2EmkgtjaUKj9ZWL5DI4VzZHOr8Rt+4sMKMaoz0KnhCugfZZdHJ6VchEwTzIBS9rToWhvI/uyx79qU6XZzPM91L/IqOzxhXZBUFWTYdKwC0/M8efA98FWmbWyvCjiYmDyjRvb5sii8Mx4yu+n5vpQT4EWn0mjzFwaUdofDS87CauG6XM7PhF1dd3CdWFEpAhr62orjuhNLjX2jDe3ro6MJD4AbhRTh+UpcMNfVH1Dwxuu4ZXsDOauzo4ZlhXyNqdLWzcEffa8E87ZtfRROn6NXXMVwBwCpsgJ42u8okVOvuXbGUcYgrS5L06+bZZF5Z8CgV1vnuvqZypW3CYl8dAye313r8bGw40PXkvYNaSlYiXWKHRaj/22bueKrPZ5gArF8P062mODIB9/oUR+Jxr+CX7nhCD/A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(39850400004)(136003)(346002)(376002)(366004)(1076003)(55016002)(9686003)(5660300002)(4744005)(38350700002)(38100700002)(26005)(44832011)(956004)(6916009)(33716001)(478600001)(9576002)(4326008)(6496006)(66946007)(8936002)(2906002)(86362001)(8676002)(66556008)(316002)(52116002)(186003)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?PIEQneqeDN+qIaP2DbzXEC+LTw8rhsjwztV2219WbYB3qgJF7UkEsAKQ+I5K?=
 =?us-ascii?Q?wueEznrVGgivcgWIisiXkf8/WmWwzZIptMMS4TmntejVbYd8vFssJZykEZDD?=
 =?us-ascii?Q?0BL19hgehX9WghkHH9/3qy6zY6JDy/wsGQKLHcrlh1WSyBeLopag0xQnQ8PQ?=
 =?us-ascii?Q?G2DnHnbL+Gc+jpD4WxyXIFx+ccnmUnft12qa5DCjtOADpDFKcUwDlXGytUO6?=
 =?us-ascii?Q?Bf2QImWI81uZCltUoDR71dcpNtA2Cn29zQ9iNhnnBWYESz03BXOv+ZfqdLbB?=
 =?us-ascii?Q?9i2D+Rmv+iDFH1c/NUOpVkoWwMhxXinfXiTkPocp95WxjoCLVOo2PKl6GQpU?=
 =?us-ascii?Q?B2pnRTkcP4mekXCTr5gcSKbOEaJmOFDGfYqFxcj4iL40aMhLx2xXp4NrMJsK?=
 =?us-ascii?Q?MnPI2V5PWWa1VW98UPvPiwu8wNPN9Zw8N3+mCeCDObLgkeHH6ChQXyMRsjox?=
 =?us-ascii?Q?NQfV0hNt6L4/wbl2RHtmqlN3MZm0ttSOA+EYh1AugUMKXpg4k0/h9Gobpdxi?=
 =?us-ascii?Q?punfEUmpeclQ/UYI9Ph/0d9Z648IAjpVXCi5knSG3WH0rSoLvmoGMqE+NAs7?=
 =?us-ascii?Q?l390UGituOg/JGSZGkNjw2pyV/G5zSxDIOpGBr1svqhoVRqnG9Kh32+x0CFc?=
 =?us-ascii?Q?Y9R4k6Y5zGFRzYLNZTZr+Apfte1MK2gw3I4P7NnfL+WX+t1HAtilP+hmPDI+?=
 =?us-ascii?Q?0KnaZojZZLbS/0Lb+dN/ZKmpBhdU9XUoOhwRaU2uJKzwyz6FVdpG7mBv7Tm6?=
 =?us-ascii?Q?lrsFCtZPVJj+TpwQQz9iY8G7ulTrk0gZ5O+dKYKyg6PasBwBi9sSzvU0Hqd7?=
 =?us-ascii?Q?DBLr22Q3mKFQutqIB43KtehKki8aKsOorntYftQymfuvzu7B223pFy3/CM30?=
 =?us-ascii?Q?38DuBXk8k4LH235A7SKs6hxXAdu1TVUlL0LEsk5CmhaKEWJ3js33Xk5lV1EH?=
 =?us-ascii?Q?1ssWUgMQG6X6RFCm6OHOGKmg4FL42wZs9n3fV3Z0sNo7nCUAgQRGrrMGNkpT?=
 =?us-ascii?Q?khWbP1NXkyjgJ6c/wcvASfVT6jTfi+gU+jVwyO32Ub2qAzNpi6w8txXiZpzQ?=
 =?us-ascii?Q?CDOuC3RCs3+Awr5fWlouIhE8I7TGHymCpZfOrlFyeWPoFwOcY5cWkpKC/3RZ?=
 =?us-ascii?Q?QUBq2jESVKAcBsDmHil4JU7EpqxBtCpoY0mnBjmp/kKFarPWNasvTufBhC3X?=
 =?us-ascii?Q?Q+/sNeKHbh+rXXBbkimwACIyS4DyGWzx7sTRt5P47WW9T47PiSmfPpZslMAQ?=
 =?us-ascii?Q?SIpW/6GM6HXg/BKNKO1I4gIKUeU26YmQdalETOl5z+oMt+C+rXpSp8tl2zvh?=
 =?us-ascii?Q?6rVY9CT/zpQAKfHWykPchi9i?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4b4cabf-191a-4958-748a-08d96bb79a5c
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2021 13:10:56.4062
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zsqvOSOwZ7V2hHNVWWrh1ZGx51/xFuui2Ky8+g6QadN9SkEFtB/5ITpN+Ihwpdw0hGaWwd53obBR7d+yS03IdIAnGdMseWnJbYDL6cH2JOx9g8nzc+9/ZclBLDHzoJWa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5249
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Robert,

On Mon, Aug 30, 2021 at 08:05:30AM -0400, Robert P. J. Day wrote:
> 
> In the example in section 3.9, the call to d.getVar() needs to have
> the additional arugment of "False" so that the output is not expanded.
> 
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> 
> ---
> 
>   pretty sure it works this way.
> 

The second positional argument is indeed "expand", which by default is
true.

Reviewed-by: Quentin Schulz <foss@0leil.net>

Thanks!
Quentin
