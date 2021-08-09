Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.49])
 by mx.groups.io with SMTP id smtpd.web11.20845.1628503074334230277
 for <docs@lists.yoctoproject.org>;
 Mon, 09 Aug 2021 02:57:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com header.s=selector2-cherrycloud-onmicrosoft-com header.b=L69PXC1P;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.20.49, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gTk8NMGBL1+BO875wzWgef4FUE+y0Kp5nOxvYccg3gW9fD8iJ1gXT6oEgzuXQc3FVnAUEEf1sTuokiIfSaZcLdZA3uA7lVt+HXLPDOI8jDdbjRFmSTZXwbSAuTgEy4CdR5VRhbVEzU/2V++0pqRDagm9HpjbheNaOOAO5edyhRs+GDTgw02iX4pKBXzq74eEu2cUTQHm60xIPiDDgmipsBw2h2ufP/2cBHnEcFtzyb2cge0x7IaXR3I3CBa9CFuL9FbpDIcJnGvj3ed4Lj8jKJYyiL04N8+bhVLyXTyz/aBrOjlv44PEs0Yj3GmLNMHWC2ZvAhh6qu9tehMO54Qsgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4N5EUZnKmqUVKA9vLfkVTnjJ1txkoIUQ6ij3c6nBT9Q=;
 b=Cjlhxlb5TmMRPhoQRawhtYNwYc9zqKuHKeQLnizRfUfmbIDE3ZoTaZ1BE9ZwyIeuawwcOquDA1uyM/b3XXGB0oh1H7eZb7blxnOSbQuL74n2YaVVqix7NktW4GJLlvjFfGvAn3BH3tiJYFaS8ckY7OSKvppq+zkYy+HlMMV98T772T9biieNE68Koaoo0I2sy/VaeNNKqn4SSRTDMl0jeCXkWYmIrNpeMmt6tyOGLhFJnncHYl2uhOfJcIpOoOtPdUIpWOQjfo+U89JOnPppg6uGQWIYrTYph95nYHOlARMjRZK5ytpYVj0ew49v39pS7NHPiEqBYDjTyptgcrZxlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4N5EUZnKmqUVKA9vLfkVTnjJ1txkoIUQ6ij3c6nBT9Q=;
 b=L69PXC1PlnRVS1H4mUejWd8i2RXq/yW6/KzoA6L22pPLQtCiewhAppeL1gP3ZSSnY2LccOaPZ/0SQnHPVKhvWDonntrENfcyPT9xYolhfsmcsYqg9rg5PVUFmpGg6dZOzg9r+g71eFINH7BApt/WPX4yLqbO9PxVIm18e2O5V0Q=
Authentication-Results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none
 header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM8PR04MB7249.eurprd04.prod.outlook.com
 (2603:10a6:20b:1d0::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15; Mon, 9 Aug
 2021 09:57:52 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::459d:3240:1c4e:b920]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::459d:3240:1c4e:b920%6]) with mapi id 15.20.4394.023; Mon, 9 Aug 2021
 09:57:52 +0000
Date: Mon, 9 Aug 2021 11:57:49 +0200
From: "Quentin Schulz" <quentin.schulz@theobroma-systems.com>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org, Quentin Schulz <foss@0leil.net>
Subject: Re: [docs] [PATCH 0/6] overrides syntax updates
Message-ID: <20210809095749.emmddxv2z6veks25@fedora>
References: <16982E35B25A391B.6121@lists.yoctoproject.org>
 <6e5fad0b-045b-dac2-6328-66d863390621@bootlin.com>
In-Reply-To: <6e5fad0b-045b-dac2-6328-66d863390621@bootlin.com>
X-ClientProxiedBy: PR3P191CA0045.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:55::20) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
Return-Path: quentin.schulz@theobroma-systems.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fedora (92.42.140.82) by PR3P191CA0045.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:55::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.19 via Frontend Transport; Mon, 9 Aug 2021 09:57:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2e876e8e-f352-4d76-591e-08d95b1c26dc
X-MS-TrafficTypeDiagnostic: AM8PR04MB7249:
X-Microsoft-Antispam-PRVS: 
	<AM8PR04MB72494FA79E7B7A5728E46FBEC2F69@AM8PR04MB7249.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bPZcyMXtV7zIX44lDBJ8TRwW/W9QvYn9KQwWjoBiwbvbBox0Gd7tif0U8P6kyfyxXmVkJNgWMOKEoqup07pJA4oMYtMcWxISij7TvDaFFaHWwALFx2nb2QjeDfuemDLf5WohBI+NPs10Gyfvhaad+4FgB7qFruM0jV9n3rgRQ6tmdgZLFe0KayKRzp/RIF5lIkX1Y2UrsESEBwPgHltnJn/vXQP1VwaR1MgiQ1Sfn+VMQvEI3NrTfbjAZ0603Rk8xwSgSVFjah+GTBQlgMi0WPSDreSGRm+NZzEQ7y/QVEVvWaq9bvbPjb3Uemg1J4QKARdfAeqTPit+KFvOgeYprpoTej5aqcqnxgEsI0vNHawGUl9QBP+AukIin79nORKk94Uw4PpftIwDdo9RsNhrp/ORIiurlF3E4dsGSRUMIh0BDnjaPQT3MVr9gh4rskg8d+tVuDRC2r/ua1cQRz64AicBxXQxenzbRdhxB84rlHXMYw79zJ3y/A5v+kqd7K4Mvx7Hm4OhvHT99Fy7eqJQuaTbGdWpPPVtCVYYfSBlR8vjIcc+ZRcqPO7VzCrNTNz+VP02Zmwr7ly5JsNjUOaveUt47XsX28MPSLDpznKDiNOUaUjTPnD9JQI8Whv/vi9q30ueiZdhOY5s3TzW6k6eQxtIwNQIghzac7s50eedoTpMpFT14UztatDD08/STbyjSQxDiekuWsKkcd3pTgUpBIItrD/GEGz+yEoEyMuuGSteLW8TR8vNkH1JIhHdNxcxunWHZFyEypnGmS6yD0xWZQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(44832011)(15650500001)(956004)(966005)(186003)(5660300002)(8676002)(66946007)(1076003)(316002)(33716001)(83380400001)(8936002)(55016002)(53546011)(508600001)(38100700002)(86362001)(26005)(2906002)(6916009)(66476007)(6496006)(52116002)(9576002)(4326008)(9686003)(66556008)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?I+nyXznTNdioDjIlfjcYu2qJY57iCwnwJ2z8ExE6f2HKnVWMsvYwToOU3piE?=
 =?us-ascii?Q?W8q1n75lsoCQmKNCNwg9Akj/RbyQsDreiO1ZmTFfUX/8lQhUWh4kCg5YXjGq?=
 =?us-ascii?Q?hVU6AD3KZFjXI4jqW0pdk1xELh8bteUOWIndc3Gu8TKA+ObA0RIJJkiBjWeb?=
 =?us-ascii?Q?9kLkIGCCdepg+R9//ecBj6xu2KhhA/JzPVW4ZzTf6XU+a6AkqUIO1YEtPs8a?=
 =?us-ascii?Q?E/aVL9a5tZdXj9lgj4HvfX8vsNn0s2+SoXWzk79IjZc3vlhKlGZQ00Ju2xbA?=
 =?us-ascii?Q?9CDAliwZCYCHv5oIlSfkY6cEmDjjdUa3WReS25RLhu7T3fm4LlkZPgRsVCqG?=
 =?us-ascii?Q?LxlxLHcnIIA96haHy+mrrIy1gJoJ+7GXO1eKa6z9tjUWfda25+Sk4bhiPi1U?=
 =?us-ascii?Q?0ZkvbbHnOx8JYtULq4r//sTOb8p12PXh5qGKwkTPKQ738cR0bJEYFieTEwtL?=
 =?us-ascii?Q?B9uS8NtHRGslZ1ZaRoBmKCDIMkWTzitBN2kE8auZiOGuY5Kd2PdcJXpM0+Xm?=
 =?us-ascii?Q?kYcLna4m267L4FCB+0gc9aB6SczPAeozuA6V2PzKjYqog8IW+boo9erKWKxB?=
 =?us-ascii?Q?U8NJ7TubpkwCqvZ58t3Iy8lbnT6HIFT60UwsGESH18OjsZwMJTHcQdXAG5Tb?=
 =?us-ascii?Q?ebSQosQ2LxfaSDA6LXzZyGABeg4GuOP8LyG1AROjccFKBtvhmePOczJVIuZo?=
 =?us-ascii?Q?ASwmbs0SKwxDdOB1IplO9DW8jNPC+ruNHGJlgJsNR5tc1ag8WQEKSZI6BqTn?=
 =?us-ascii?Q?q/KsZGULr6t6Z8fS2cVv7sB+RP9A9vJDv5aWmstx06uTJG/cD8ii8q0dT8A8?=
 =?us-ascii?Q?1gpdgNMRH/bsZPSvwNhON0Bj4b+Znm1XRsbWNAP05KHBSrxgGunGCu2YAXLd?=
 =?us-ascii?Q?MyvxCpC/JMBtMI7bi5JXnXn3WswKtkmaS5GJhFVIJW9xyp+bYQT1Lt+g4H/q?=
 =?us-ascii?Q?bnmwyVOHn2sxBsGbHYsWjPPzhcYrOGOxQ5K5BbPKqlSxzg9S5zYpP8NjPRbL?=
 =?us-ascii?Q?2CL+rfEPNyV831wGz9VC5H1l0Fc9gc4HUnjObi3L4/ErWkSY8SNNNdVbi57w?=
 =?us-ascii?Q?PXsJwMurngbXzxq8HkgR1Phy45JRvv3LYc/d7o4zJxa31SArl8qEPoSVdISw?=
 =?us-ascii?Q?rXqrzRsj2hLff7KSNx9cYWOjK4mn+xlZ8yOdfXjY9NMARJLJwwx+NQiYW+AA?=
 =?us-ascii?Q?zMfxJvGx03JjXLABqCGAl3/IwxN/q9rlP/MG9xU5gfmiqmDjJ+X2dZNZvRtZ?=
 =?us-ascii?Q?T07/RcH7mwHhbVo76isZ/GW+aRQjr546iQNC8rq6BvMiWptdpnVkABfNFy8b?=
 =?us-ascii?Q?xujH6ajfZGDF+p2CMP/Qmblu?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e876e8e-f352-4d76-591e-08d95b1c26dc
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2021 09:57:52.0000
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: taNlt28QCnmCnWOp6F1V3bCST8YLnWia2UekaISyTDjs0wccs/DteeoTquk84J2p06Gz6o/4wHo2CD2vQ3KFLXiExjtux54l6QSilHeFagHir/6fiqwc6gX9babrYeU4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7249
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Michael,

On Mon, Aug 09, 2021 at 11:52:18AM +0200, Michael Opdenacker wrote:
> Hi Quentin,
> 
> On 8/4/21 8:34 PM, Michael Opdenacker wrote:
> > This is the result of automatically converting the YP manual
> > through the scripts/contrib/convert-overrides.py script
> > in oe-core.
> >
> > As suggested by Quentin, these changes are also available
> > on a dedicated temporary branch:
> > https://urldefense.proofpoint.com/v2/url?u=http-3A__git.yoctoproject.org_cgit_cgit.cgi_yocto-2Ddocs_log_-3Fh-3Dcontrib_michaelo_overrides-2Dmigration&d=DwICaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=GdNARbtF_zqDmhk7gce65NXaQzcgpYhGA9odeaApclA&s=eVMXZdEuvxXpBbiJjDGnPNgMxCZWfbyWvy_R6_9oJsI&e= 
> >
> > Your reviews are most welcome. There are probably errors,
> > that we can either fix manual or through script updates.
> >
> > Thank you in advance,
> > Michael.
> 
> 
> Not sure you're here this week, but in case you are, I remember you said
> that some of the replacements are wrong.
> Don't hesitate to share those through patches to my branch.
> 

Yeah, been busy last evenings, sorry.

The script is good to start the work, but there's some additional work
to be done :)

Also, I think we should watch the Bitbake ML for variables that didn't
use overrides but now do. That's on-going work to bring some consistency
:)

I guess I need write access to the contrib repo? Who shall I ask,
halstead I guess?

Cheers,
Quentin
