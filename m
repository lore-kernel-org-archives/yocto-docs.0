Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0E4AC433EF
	for <webhook@archiver.kernel.org>; Tue,  9 Nov 2021 09:29:22 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.49])
 by mx.groups.io with SMTP id smtpd.web11.9835.1636450161243173812
 for <docs@lists.yoctoproject.org>;
 Tue, 09 Nov 2021 01:29:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=IaAkY5/R;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.6.49,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sp26rl5Ag5KUW9Okf4xHtl933ELXN7c1LTLwJaG1tyophn+XScJryxyoOtQycF2BmrVw+oXMeYNN84JUytuQ8a2MriDpZMfUHsrm0QZshFiq+R9HBYeVDQVhM8Fha9e181PzerUaf3NWzU/HPf7JfWI17yVA4FeycP2Jg7MbbNY4dDFXaTxbTsUfDqL/3fvDZBmiIvXHwBbtDkF2TSFDBhCpWBskMOrDoQWfaz7Z2HBeXrNZqRkWvGQCyPjzuE+Wb11TxPH23WfbUzT23rHVHrBqQr/8Folqq6y6Yqi/Ik8bZjO7KY2c4OPOfXIyJy0WMKMY7IxHR2h1IG871rdT8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4VEVHpRlWBnnyTXm+lgzs+Rt/xmT+qQkqsmMH0MouDc=;
 b=hNgltYQCVcvGMsWjg2dG6MrrBjx2T4CWekh7sSvksA5Yw2Vvbc+XJo84JlsI/pwVZ//NPRZRHHwhzjutZrOGVzH0o3BZZxW0sHQiUzvCta+Z/OyNqwFo3EgzfSI90gCDwxjbd6om8IDAw+pLiUlSJA77DVulUiBWd+owPDXjQzN7qbjW2h88pgk+AkRpSE4TGBMpO4yRRHt0akH27dSMovduDY9um9D8943TAq+MmcA4T1IGllvNrMtpWx+WVrhLNT8qigizEo6JmvGSfiZQ0UHB0hQsUeh+ROEa2m1Dl3KvUXviQwwA/8afnabsr9YyPwYBmgn+w2oc7TSDrGuG2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4VEVHpRlWBnnyTXm+lgzs+Rt/xmT+qQkqsmMH0MouDc=;
 b=IaAkY5/RlQ4fLGG7icS1Uy0/9Y2plTbB8MAieIV7BSWfXGIonTsFqe1nU5q76KVOOC3AN2zuVgMKwEIrXojRI72rfiO0PTRP+9fNfhpANPBxYncSflZQrP26TFeRD8nbXGUdlnJlrSMUJHSzXVI5A/8SjsYMaXf1fkrT+9XdQw8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Tue, 9 Nov
 2021 09:29:18 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::d56f:ec59:3bd0:6d7a]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::d56f:ec59:3bd0:6d7a%5]) with mapi id 15.20.4669.016; Tue, 9 Nov 2021
 09:29:18 +0000
Date: Tue, 9 Nov 2021 10:29:16 +0100
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: docs <docs@lists.yoctoproject.org>,
	Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Michael Halstead <mhalstead@linuxfoundation.org>
Subject: Re: [docs] [bitbake-devel] [oe-core][PATCH 1/2] devtools: Initial
 recipe for repo 2.17.3
Message-ID: <20211109092916.h56hptpwsmlo34zg@fedora>
References: <a82b048c5f9f164696b1dd1e3e6c4997ede4f5ad.camel@iris-sensing.com>
 <45438478b288da1880e92bb1ccc246732a24abc9.camel@linuxfoundation.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <45438478b288da1880e92bb1ccc246732a24abc9.camel@linuxfoundation.org>
X-ClientProxiedBy: AM6P195CA0011.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:81::24) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
MIME-Version: 1.0
Received: from fedora (92.42.140.82) by AM6P195CA0011.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:81::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.16 via Frontend
 Transport; Tue, 9 Nov 2021 09:29:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3f8565a9-b4d1-435e-602d-08d9a363676f
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:
X-Microsoft-Antispam-PRVS: 
	<AM0PR04MB70449B65D4078122FDCBD6A1C2929@AM0PR04MB7044.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WduEHP17BR8KLbvTEbl8nyyy2p7DsCiTxe3rSM51AcE1tlrGp0obOxEdZIFlkyhSGET/vQSapvpTL6b4f0BwU2n7cF+sLvvx4VYj584jF90+O3wNxywjZWdK4EEgJSnkH0hQrROeRn8Y7KI/5O1o52UC+DycoxOBLKKt+gIYK3SutpVU3iZdXOG6XjKv/eJiVj4SMnUam2VO1dqdf7AtpX/PctV33+rJiW1eMXed1p6GXCX5Xa3yIhmXO/0E1pAn0SP9QNA3tmcsK2ejPjwDjh5j6dgenTK67dSHF+cZt1JSSQSbZBa//kBwfPiriqtuhsDopYbBu9RV9NAjJa+bSwXpEBzqobNgPOKVo8mEz3fqBtkSJGiYWOXM+cfF2nfgJj5rkIgZQ6krKpsn7FIlloVJG7iQmMfco6WJVNR8aYGAZN/ZtFW8jnqtrDya0CfBESK+BYEQ31ImIQrMF6l+kwkjoV7gr5sMAKHcila5GlvAxkSrSis2G0D6SgYFEZfD9w85cknv3E5YOhxv51PvMJiqgEj6i0YQh2bphFXA3+t9sIlDpjdbKGuYJgER8lFLBKTQ9E5ASBFscG1PHgeD1UdwBqRGht75ty5REvWHj1tyWkaHSsXmZQ1ExwMAzku5Gi5Ob5Znm+Ilha26ixMUYJ0/6y6fZ+rfwchRoBBdYHvBw4JREhayWKOgukcNkt6b
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(86362001)(956004)(5660300002)(44832011)(8676002)(2906002)(6496006)(38100700002)(1076003)(4326008)(508600001)(55016002)(38350700002)(6916009)(52116002)(186003)(8936002)(316002)(26005)(33716001)(54906003)(66556008)(4744005)(9576002)(66476007)(9686003)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?bnCwdfaMgXYT8ScPhnazvMvAIsDqwRml0xxMr5TLqyMhK5/2vBDyPMjHzS+s?=
 =?us-ascii?Q?ykUIN4SB6Ven/bXz4c7wjOA4RCWZauzR0/e5sTMLwMFe+PvYwBpoIOldH0V4?=
 =?us-ascii?Q?S12uRYrQ0kEO2TXMbCzdSohQOHhmKxbRKLPMmAYauOLAUX2a36ERveqMr4iS?=
 =?us-ascii?Q?jiIloALnroxkHiN3sII/Gl4Yyrn7imk3QIMza9RCBvTTpzv1gzBUt434UmlZ?=
 =?us-ascii?Q?4Wi2KH61jXZW/7veq746bsHTU6EkpvzZSbNuX5d08ROUkMpZTSqZZOVfmRyj?=
 =?us-ascii?Q?XyftCcI0WD1P9Rz4whw6N8JOVbE/lkcwflnn+SPVpN659V5x1tH3KIuG5NLo?=
 =?us-ascii?Q?Ngy7mFGjVHDdlvRuIwatO8RLaH7V1oZ1ySVyRbWjZYQBWfV4mspRrnphC/Bz?=
 =?us-ascii?Q?JQx76FlOnQmKOHO0TLq/srJ6v7V5+BArRJdqJAurPkyslZqQH35gJynXYio1?=
 =?us-ascii?Q?WjsMYcTt9fOtdBRZb0F+BuTp/o50viDT0wDA68jrmQ6IopTBIHvuo4nkxBc4?=
 =?us-ascii?Q?EFli/SFhBgMKJasCvDCn2zUL2sSHfh/XHCvgNrPtAltIW0cLuvnPbHWHXMae?=
 =?us-ascii?Q?IyMjkevo+/3hePbQXeCSWMCtAMrT5eCl9ty1TqXwuIBr89nmZ4zcaI7cPPXw?=
 =?us-ascii?Q?zliJm0EVa66641bEv+jPutRn5xxnK8t37M8rGoXQtNsi95Qbb+umuCr66FwD?=
 =?us-ascii?Q?0rtoQdnAUYLPrEkW+7kzfQTCRObrV8jxWxzrgQiTYNAQ8J9h5x0cKhpRdCVr?=
 =?us-ascii?Q?CQIpO65DaCimySVizjAnMhBxmyz8nPUNQk2abkWfI4ggUx5ME6Bp8bA/djkq?=
 =?us-ascii?Q?It+gp2+gW6DDmyI1eyrRIOt1bsipV8+W5A/4m1NsIwqcQJbpUyPzBsNaYqFS?=
 =?us-ascii?Q?WAi4RsRb6Wxf/tB1NPLT8oFWfU5PUjptKQIWoE55Y0WC/WcH0Ng+iTTUY9UX?=
 =?us-ascii?Q?G48rxUPJEw8QTz0JNbf3tlWRxu48+WDtMoqhe13+7nQJ36JDTzEgPRlWK5aF?=
 =?us-ascii?Q?GoIk3OKvdiUyjNJfT/ipogRj/4VJoXIJFawF/tx/slfQycX3yjmPbb6ev0mV?=
 =?us-ascii?Q?2N8DcJvbmWWc6YsyvMiS7HHDNcDY5060H+gP1WiilHSSBPSkhg2ouR0VisDR?=
 =?us-ascii?Q?D5FGqpgDcGXoOZGuIRotFmmTohO73ZqEdDxx10i1DvwAUq+sXgbep9+oVm8Z?=
 =?us-ascii?Q?j7/JBfMDWH9xo2qwfmUm39/vixyXyaTBjeJOKVRnvD26Xg+KjkR9x0P0cdJh?=
 =?us-ascii?Q?crWZjY4TEgGjMzjSbiNu88AM4e4mSDI/GsS5xVLcnqd4xUHStZ9VZOPyV1lY?=
 =?us-ascii?Q?oIJ/0yB4AbRM9xHwVrLh1owK8HycozdHSkWgDj/+COKAwgPRukY+7/8usFdV?=
 =?us-ascii?Q?Ff/9MoxuR32+1h7exUdWf5/tg4Fau9R7v2QaruS2JRD9Om84GDxcJCnSRqpJ?=
 =?us-ascii?Q?wu+ueIqqC+r1bgomolE9XFDUWgKg9tPrqqBGot3z8ahdCGRFtBa6Y9f6S20Y?=
 =?us-ascii?Q?FtNcERukVMuz89vsTSR1w2vbXnLpPXkNMxAC03ysDguZopdELyhPU/FKGduk?=
 =?us-ascii?Q?reWoMIxQkXQ5f71/QkUVeZvznnte/HUojM8mninHu7hhZaTuB4kKNmJ822n4?=
 =?us-ascii?Q?L3HADCLdzq+xPADg/nrt8BF8mZDv1hHgXlQ5Dd7XcH/A99XQa/J74P8QfQV5?=
 =?us-ascii?Q?4vwBu78KwgnQRaU6RW1oGmTgCoCt2j55v+8oCpmagz8862J0d0JkRMHw+oUh?=
 =?us-ascii?Q?OMvMZ4FvWQ=3D=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3f8565a9-b4d1-435e-602d-08d9a363676f
X-MS-Exchange-CrossTenant-AuthSource: 
 AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2021 09:29:18.3177
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 CLuAAYPyRJXT4yoVVqImGgJe4CIhii3bqvxXNlpQy/ataZq7wpsvnvwLb2kC7K5WI5svTLSyQcdkZYoQLl2dzsypzjsbUBqTo/26uQRwi5hzuty0SFtFysbd8ZROHNwE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7044
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 09 Nov 2021 09:29:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2106

On Mon, Nov 08, 2021 at 12:48:08PM +0000, Richard Purdie wrote:
> Hi Michael and Michael,
> 
> This sounds like something we should prioritise fixing?
> 

I agree.

Hijacking for a different (though related) topic:

I think we also need to add a banner stating that this doc is
out-of-date. But I just don't have the skills to do it quickly and still
have something nice enough.

Considering how long the pages in the documentation are, I was trying
to implement a banner that would stick to the top of the view (stays
visible even when scrolling or linking to somewhere in the middle of
the page).

And the same to do for the current docs.yoctoproject.org (though there's
already a header, it;s not at the top of the view).

If anyone has the skills to do it quickly, please do so :) otherwise, I
guess I'll come to it the day I can't stand it anymore :)

Cheers,
Quentin

