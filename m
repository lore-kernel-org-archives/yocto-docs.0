Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.77])
 by mx.groups.io with SMTP id smtpd.web10.14198.1630309859443410886
 for <docs@lists.yoctoproject.org>;
 Mon, 30 Aug 2021 00:51:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com header.s=selector2-cherrycloud-onmicrosoft-com header.b=ntpzxl5Z;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.15.77, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KywY4+j9hY/38nFucrKLCu2MBgHJI2+F9wPqLs+WRDB9OQ9XtGxZyQ8um4HfWJ/JY1J6zqJC0XFgqNHYvcncqIYUyu8F2T2titGXzMz539NbaR0vajWrx379WI2+VEe4jTBIBb0LUJOPZFEpEpQjw1MHeu5O/jqbz73jEl6rCCb50ZI05FRFMfBzFC8jhcCddaO8s7nqCEzudUDcWsqLhAGaRvzS2N/quQ0FaFIugm+1R6crPqaDJmg+XncXFa0ws6GWIN3c9Q7zeSfxVeJ8jSA6YtTErzcXZwzlVh92fwOMro/LmgL2azLZgL8MoO8TLOvi13QMavbdAyQs6miP8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=295sTy4qsQuvUh/tdPFc62iTH5hi0zpCrR3QBVv22Oc=;
 b=R+4GbZzCF6vkRl1NZdZ12MrRkM4v1ejhX+vvlyLWJ//odekgrK22PKU6rTd6wcq/gL+qDhvdwqr254gOy5Xcabutuo4kWF7jT5v4VIqplMqsst4YbshGaAp2jWZx5ppeXsuuHRZhvJsQAvgg9b++NInWjmPkTBdRdtOUQXeVvZasxBOYm/W9ROJfgMxfvaX2/Oq6vBMiyiyUjBHqFwb6wOERZ++ftk8FMpU04j/GYkwpNFHeWQrPnevVqG2X/vOF/YfKku1/qJJyrsDDY5+O6brsnRZlYl7Y5SQY2Iw8QbwnvU/wN15+Dtt3b2WvTlYLA40XwG3zAJjPvwNMTRz5QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=295sTy4qsQuvUh/tdPFc62iTH5hi0zpCrR3QBVv22Oc=;
 b=ntpzxl5ZLG7zL4pMu1Th3Up45sdQT8cM8T2mqo0l33QMVX1Qldi7aOv+WRhQ70iu4mCvAktFkwhBWMKMsy1FWFGflZ3N3+0+P8GU/nwbUxjWe/PbdnenA1oOWjQ6P3krtCmTb6RleVioA/MejLGhLIYwmh4mSmyS3m3gg7vLsnI=
Authentication-Results: crashcourse.ca; dkim=none (message not signed)
 header.d=none;crashcourse.ca; dmarc=none action=none
 header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM0PR0402MB3844.eurprd04.prod.outlook.com
 (2603:10a6:208:f::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.24; Mon, 30 Aug
 2021 07:50:56 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::706a:b082:742a:7d00]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::706a:b082:742a:7d00%6]) with mapi id 15.20.4457.024; Mon, 30 Aug 2021
 07:50:56 +0000
Date: Mon, 30 Aug 2021 09:50:53 +0200
From: "Quentin Schulz" <quentin.schulz@theobroma-systems.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] dev-manual: emphasize that new layers live outside of poky
Message-ID: <20210830075053.ukfstwhowux2mfye@fedora>
References: <e080c70-2cec-7e94-8fe3-ea6e25c3839c@crashcourse.ca>
In-Reply-To: <e080c70-2cec-7e94-8fe3-ea6e25c3839c@crashcourse.ca>
X-ClientProxiedBy: PR0P264CA0249.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::21)
 To AM0PR0402MB3348.eurprd04.prod.outlook.com (2603:10a6:208:24::24)
Return-Path: quentin.schulz@theobroma-systems.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fedora (92.42.140.82) by PR0P264CA0249.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.19 via Frontend Transport; Mon, 30 Aug 2021 07:50:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9b31da00-0160-4b20-7f48-08d96b8ae617
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3844:
X-Microsoft-Antispam-PRVS: 
	<AM0PR0402MB38448451192D0833D7D2535BC2CB9@AM0PR0402MB3844.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ykUEvz4oZr/5SAykXaFF8h1XkJmH/+6EwxQ6UzQhjE2moiCIjRpiB5sqds0RJkd9MgZvabPjAQ7z6IIl+Fi6slnbfBvviIcECSyyeEc/QBcURPf8q1HPGhgIdyTgUeo4viAVFW1vi07nfTTRqeMgItcFDbMYQBj3hZHdN24F4i85DcTz6pixuXP8DhNetssO0T09ehiTaT1ohSFAjzmSGAciL6qKZyxsdQ5ak7UochRF/RDHajbXT62qUxaVEDcy7rQFlrxYBLWmqaAbXFkh1bjsGG6c7ide6teSmTDUMVkqMjHfFjGXaXOZybfdCwcSyvOhqGwWr+zA2eL5+l5FYxeZo770HxCz/TMggoMcVt8m35+69xd+hLKd0qy3cflp7KKsALKYZ6PK45dOf4ACPVelQIbuA8V1TcqW3ExOxJffIkXgsg6CSOngxxCljMAiQv6TcF2M2onagZxyWwkWXq9GHPermTxpTI66LlkfVbyX/8/NPyTHhTxmea5m5OXp6nucLf/gcbQXe4vneqahlR4SPsWbzckMYbYggUmB0AEMMApz9PUXRLKelq+bfr5fzulgy6QqBL4ilNmTIEAnrbY3ptI+MNZOfaqpiIwHnBayWSOqeArA6mR062p21qfRk91/fg1cQCwuqEZ2gzDfYd9bpz0MaIO+iE/WuNGkM5OYu8r/H723nNWDpELUH/Avsb/UKK3Y/pH4uUWLME64eQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(136003)(39840400004)(366004)(376002)(346002)(9686003)(86362001)(5660300002)(4326008)(1076003)(6916009)(66556008)(66476007)(66946007)(52116002)(2906002)(55016002)(33716001)(478600001)(9576002)(38100700002)(38350700002)(44832011)(316002)(26005)(956004)(4744005)(8676002)(186003)(8936002)(6496006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?dd/gECI5hzy+Evn8iR/uDuDP+jFB5ihx1nGCO94QqhOxaXNLJYzWFj2tNOlb?=
 =?us-ascii?Q?mwa3OZwPmggKqT2Cb3cUZ6iv/ymR0jVf4UBMtq5VUSEzkqituxkcLr9kOFYm?=
 =?us-ascii?Q?fUopm7PvT7uEJK1/fLinlBO5OwXoovHLX2vdYyWeS9B4HwdGp0S0DEdkJiAI?=
 =?us-ascii?Q?+MsuNoBvWEievt6CXvhCARM0+Oz9QMysJaXsJCATj5eyux3jxXE3dy61CX5J?=
 =?us-ascii?Q?yn6XUl2HRfS2i4Yxf9xc8nffGq54oWskP7f9t0rLer3wbzTvu+XGNm+mvdYI?=
 =?us-ascii?Q?YywVK15how9RrFmPJA1zjzZS8IlHp2McNd4ilPHWwQ462eG8QUDR3mTw3jrt?=
 =?us-ascii?Q?bd1r7cfsmgGo/5JZYu1KzCehPAG1HOHBwmUIBUGqdXNP+1pL38lbccIlfTFv?=
 =?us-ascii?Q?pHyZ08O+WRCIsQo4STq+7ZGyPR/HRdbeiIiP2R25lOP4TgEahF+rsRA3fYdQ?=
 =?us-ascii?Q?Hs3PJYBL+GYawEu3JwkkCZa8XNAAB5Ow33t8aiYuUnB4hCIWJA2+z4/iE3D8?=
 =?us-ascii?Q?BgWGos674SQ6ZMkS6vu/ZMrEDpwrRgvG+b1puXH4ZOhT+CEfp2GoD3mQNEjZ?=
 =?us-ascii?Q?vmWEr0YOldiDvjLKMxGJkuAL8jCXrPsu/rj4Knxn/fijKqpu0OPf4ZH6Yvvk?=
 =?us-ascii?Q?uGyplDVmL/Nv97PmsRuzbU4gSeoGI1cU9yFyuGSq1VO0F38zHIgoqwvJAA3r?=
 =?us-ascii?Q?5meLeVWL2stvbIBgz73rTFtSSwaw/gLyYq3KYWWUV4JT1JoWRc945epnjsc2?=
 =?us-ascii?Q?/RFaMOdu7A2i8xeUXvFnzVcw7TqwBh60drmn6WuWKvNG6k935QLGfbYTlT82?=
 =?us-ascii?Q?5FwjxhmO2dtzdVEzySIjYSF6SmaM1qj9btoq5lTnPNgK4FOBkczKiBsQsuJs?=
 =?us-ascii?Q?6gRxnw27GmGJjHLJK/mLyhOkl1hl94OeLfz1zB3cYDwxLAMTpLs3XB+gM0dU?=
 =?us-ascii?Q?CXLmZh4nQc68Aorl14h1PweeYvUk/K79jch1URx9mJBgrRGPT8iqYl+CuI/Z?=
 =?us-ascii?Q?iyUW2CyqhHanNzzI8yM7dbCItF7ot8HDv03AXLA92an8DDJ//5Hv8QLQsBHZ?=
 =?us-ascii?Q?85jFKiPh75q8Wbdf0PN9mL90wCcfNGbhEFi0+6X6mbZ+IUjdelNlKiRa5KDJ?=
 =?us-ascii?Q?FsNAUjm7urdjDs/55LoHqIwKdQa5eRRC6x4G6uBfY4qTixTfYc5EbhKkZRU6?=
 =?us-ascii?Q?nd/iflP8fJf6tDI2Fq046DoucDAC9GN+Pjrms7Br2XawSW+eew+KnoHr+ltl?=
 =?us-ascii?Q?yhLVsKoOvT+y+keeIiNg/f2reKEWYbODGECbiUIXWCRmYyrWHtbRcVVc4CWC?=
 =?us-ascii?Q?vl1HIse0fjFpBrO67tg2kYv2?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b31da00-0160-4b20-7f48-08d96b8ae617
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2021 07:50:56.2012
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6nxJ5hLsgx630Hd73BUfXPXvjFJhAkZdpRnYpQwDNxQvfHmfPKFC8gO3KP9D0vVlp+I8J0fyp2HWPDFBjb/oSPa6bf8whGyiZl22+fneyshEn9w0j9xGnCho2HFFOwFP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3844
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Robert,

On Sun, Aug 29, 2021 at 05:42:31AM -0400, Robert P. J. Day wrote:
> Tweak the bblayers.conf example to encourage the reader to appreciate
> that any new layers should not share space with the official Poky
> checkout.
> 
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> 

Reviewed-by: Quentin Schulz <foss@0leil.net>

On a similar topic, I assume we should change the "Adding a Layer Using
the ``bitbake-layers`` Script" section to have meta-scottrif in
/home/scottrif/. Basically outside of build directory at least :)

Cheers,
Quentin
